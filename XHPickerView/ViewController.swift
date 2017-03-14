//
//  ViewController.swift
//  XHPickerView
//
//  Created by xiaohui on 2017/3/14.
//  Copyright © 2017年 xiaohui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var lb: UILabel!
    
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        array = ["菜菜", "金刚", "星云", "浪客", "鱼头"]
    }

    @IBAction func showPickView(_ sender: Any) {
        
        XHPickerView.showPickerView(view: view, title: "你最喜欢谁？", sureString: "确定", array: array, selectedString: lb.text!) { (string: String) in
            
            // 赋值
            self.lb.text = string
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

