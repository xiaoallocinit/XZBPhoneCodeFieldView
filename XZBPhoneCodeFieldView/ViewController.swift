//
//  ViewController.swift
//  XZBPhoneCodeFieldView
//
//  Created by 🍎上的豌豆 on 2018/11/19.
//  Copyright © 2018 xiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var label:UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.text = "请输入手机验证码"
        label.frame = CGRect.init(x: 0, y: 150, width: self.view.bounds.width , height: 30)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(label)
        let codeView = XZBPhoneCodeFieldView.init(frame: CGRect.init(x: 50, y: 250, width: self.view.bounds.width - 100, height: 50))
        self.view.addSubview(codeView)
        
    }


}

