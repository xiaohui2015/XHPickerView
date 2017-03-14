//
//  XHPickerView.swift
//  XHPickerView
//
//  Created by xiaohui on 2017/3/14.
//  Copyright © 2017年 xiaohui. All rights reserved.
//

import UIKit

class XHPickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var title = ""
    
    var sureString = ""
    
    var dataArray = [String]()
    
    var titleLabel = UILabel()
    
    var sureButton = UIButton()
    
    var selectedHandler: ((_ str: String) -> Void)?
    
    var selectedString = ""

    
    
    class func showPickerView(view: UIView, title: String, sureString: String, array: [String], selectedString: String, selectedHandler: ((_ string: String) -> Void)?) {
        
        let pickerView = XHPickerView(frame: view.bounds)
        pickerView.title = title
        pickerView.sureString = sureString
        pickerView.dataArray = array
        pickerView.selectedHandler = selectedHandler
        pickerView.selectedString = array[0]
//        pickerView.selectedHandler!(array[0])
        view.addSubview(pickerView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0.412, green: 0.412, blue: 0.412, alpha: 0.7)
        
        let containerView = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 176, width: UIScreen.main.bounds.width, height: 176))
        containerView.backgroundColor = UIColor.white
        addSubview(containerView)
        
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: containerView.bounds.width, height: 44))
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor.lightGray
        containerView.addSubview(titleLabel)
        
        
        let cancelButton = UIButton(frame: CGRect(x: 15, y: 15, width: 13, height: 13))
        cancelButton.setImage(UIImage(named: "allocation_close"), for: .normal)
        cancelButton.setTitleColor(UIColor.blue, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        containerView.addSubview(cancelButton)
        
        
        sureButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 60, y: 10, width: 46, height: 30))
        sureButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        sureButton.setTitleColor(UIColor.green, for: .normal)
        sureButton.addTarget(self, action: #selector(sureButtonClicked), for: .touchUpInside)
        containerView.addSubview(sureButton)
        
        
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 44, width: UIScreen.main.bounds.width, height: 176 - 44))
        pickerView.backgroundColor = UIColor.white
        pickerView.delegate = self;
        pickerView.dataSource = self;
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
        return 44
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        titleLabel.text = title
        sureButton.setTitle(sureString, for: .normal)

        // 设置分割线的颜色
        for v in pickerView.subviews {
            if v.frame.size.height < 1 {
                v.backgroundColor = UIColor.lightGray
            }
        }
        
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 18.0)
        lb.textColor = UIColor.green
        lb.textAlignment = .center
        lb.text = dataArray[row]

        return lb
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedString = dataArray[row]
//        selectedHandler!(dataArray[row])
    }
    
}
