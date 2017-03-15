//
//  XHPickerView.swift
//  XHPickerView
//
//  Created by xiaohui on 2017/3/14.
//  Copyright © 2017年 xiaohui. All rights reserved.
//

import UIKit

class XHPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let ScreenWidth = UIScreen.main.bounds.width
    let ScreenHeight = UIScreen.main.bounds.height
    let ContainerViewHeight = CGFloat(179)
    let TopViewHeight = CGFloat(44)
    
    let bgColor = UIColor(red: 0.412, green: 0.412, blue: 0.412, alpha: 0.7)
    
    var title = ""
    var sureString = ""
    var dataArray = [String]() {
        didSet {
            pickerView.selectRow(2, inComponent: 0, animated: true)
        }
    }
    var selectedString = ""
    var selectedRow = 0
    
    
    var pickerView = UIPickerView()
    var titleLabel = UILabel()
    var sureButton = UIButton()
    
    var selectedHandler: ((_ str: String) -> Void)?
    

    
    class func showPickerView(view: UIView, title: String, sureString: String, array: [String], selectedString: String, selectedRow: Int, selectedHandler: ((_ string: String) -> Void)?) {
        
        let pickerView = XHPickerView(frame: view.bounds)
        pickerView.title = title
        pickerView.sureString = sureString
        pickerView.dataArray = array
        pickerView.selectedHandler = selectedHandler
        pickerView.selectedString = array[selectedRow]
//        pickerView.selectedRow = selectedRow
//        pickerView.selectedHandler!(array[0])
        view.addSubview(pickerView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = bgColor
        
        let containerView = UIView(frame: CGRect(x: 0, y: ScreenHeight - ContainerViewHeight, width: ScreenWidth, height: ContainerViewHeight))
        containerView.backgroundColor = UIColor.white
        addSubview(containerView)
        
        let topView = UIView(frame: CGRect(x: 0, y: 0, width: containerView.bounds.width, height: TopViewHeight))
        topView.backgroundColor = UIColor.lightGray
        containerView.addSubview(topView)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: topView.bounds.width, height: TopViewHeight))
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textAlignment = .center
        topView.addSubview(titleLabel)
        
        let cancelButton = UIButton(type: .custom)
        cancelButton.frame = CGRect(x: 15, y: 15, width: 13, height: 13)
        cancelButton.setImage(UIImage(named: "allocation_close"), for: .normal)
        cancelButton.setTitleColor(UIColor.blue, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        topView.addSubview(cancelButton)
        
        sureButton = UIButton(type: .custom)
        sureButton.frame = CGRect(x: topView.bounds.width - 60, y: 10, width: 46, height: 30)
        sureButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        sureButton.setTitleColor(UIColor.green, for: .normal)
        sureButton.addTarget(self, action: #selector(sureButtonClicked), for: .touchUpInside)
        topView.addSubview(sureButton)
        
        pickerView = UIPickerView(frame: CGRect(x: 0, y: TopViewHeight, width: ScreenWidth, height: ContainerViewHeight - TopViewHeight))
        pickerView.backgroundColor = UIColor.white
        pickerView.delegate = self;
        pickerView.dataSource = self;
        pickerView.autoresizingMask = .flexibleWidth
        pickerView.showsSelectionIndicator = true
        containerView.addSubview(pickerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sureButtonClicked() {
        selectedHandler!(selectedString)
        removeFromSuperview()
    }
    
    func cancelButtonClicked() {
//        selectedHandler!(selectedString)
        removeFromSuperview()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 47
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        titleLabel.text = title
        sureButton.setTitle(sureString, for: .normal)
        
        // 自定义分隔线属性
        for v in pickerView.subviews {
            if v.frame.size.height < 1 {
//                v.frame.origin.x = 100
//                v.frame.size.width = ScreenWidth - 200
//                v.frame.size.height = 1
                v.backgroundColor = UIColor.lightGray
            }
        }
        
        // 自定义行属性
        var label = view as? UILabel
        if label == nil {
            label = UILabel()
        }
        label!.font = UIFont.systemFont(ofSize: 18)
        label!.textColor = UIColor.blue
        label!.textAlignment = .center
        label!.text = dataArray[row]
        
        return label!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedString = dataArray[row]
//        selectedHandler!(dataArray[row])
    }
    
}
