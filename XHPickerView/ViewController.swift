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
        
        array = ["Swift", "Objective-C", "C", "JAVA", "PHP"]
    }

    @IBAction func showPickView(_ sender: Any) {
        
        XHPickerView.showPickerView(view: view, title: "你最喜欢哪种语言？", sureString: "确定", array: array, selectedString: lb.text!) { (string: String) in
            
            // 赋值
            self.lb.text = string
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

