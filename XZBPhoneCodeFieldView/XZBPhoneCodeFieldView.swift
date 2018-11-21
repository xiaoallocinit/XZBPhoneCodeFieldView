//
//  XZBPhoneCodeFieldView.swift
//  XZBPhoneCodeFieldView
//
//  Created by 🍎上的豌豆 on 2018/11/19.
//  Copyright © 2018 xiao. All rights reserved.
//

import UIKit

class XZBPhoneCodeFieldView: UIView {
    lazy var TextField : UITextField = {
        let text = UITextField()
        text.autocapitalizationType = .none
        text.textColor = .clear
        text.tintColor = .clear
        text.backgroundColor = .clear
        text.keyboardType = .numberPad
        text.addTarget(self, action: #selector(TextFieldEditingChanged), for: UIControl.Event.editingChanged)
        
        return text
    }()
    
    var itemCount : Int = 4
    var itemMargin : CGFloat = 30

    var labels : [UILabel] = Array.init()
    var lines : [UIView] = Array.init()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configTextField()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configTextField() {
        self.backgroundColor = .white
         self.becomeFirstResponder()
       self.addSubview(TextField)
      
        TextField.frame = self.bounds
       
        let temp = self.bounds.size.width - (itemMargin * CGFloat.init(itemCount - 1))
        let w = temp / CGFloat.init(itemCount)
        
        var x = CGFloat.init(0)
        
        for i in 0 ..< itemCount {
            x = CGFloat.init(i) * (w + itemMargin)
            
            let label = UILabel.init()
            label.textColor = .black
            label.textAlignment = .center
            
            label.font  = UIFont.init(name: "PingFang-SC-Regular", size: 20)
            label.frame = CGRect.init(x: x, y: 0, width: w, height: self.bounds.size.height)
            self.addSubview(label)
            labels.append(label)
            
            
            let line = UIView.init()
            line.backgroundColor = .gray
            line.frame = CGRect.init(x: x, y: self.bounds.size.height - 1, width: w, height: 1)
            self.addSubview(line)
            lines.append(line)
        }
    }
    
    @objc private func TextFieldEditingChanged(textField: UITextField){
        if textField.text?.count ?? 0 > itemCount{
            textField.text = textField.text?.substring(location: 0, length: itemCount)
        }
        for i in 0 ..< itemCount {
           let label = labels[i]
            let line = lines[i]
            if textField.text?.count ?? 0 > i {
                label.text = textField.text?.substring(location: i, length: 1)
                
                line.backgroundColor = .black
            }else{
                label.text = nil
                line.backgroundColor = .gray
            }
        }
        // 输入完毕后，自动隐藏键盘,跳转到下一页
        if textField.text?.count ?? 0 >= itemCount{
            textField.resignFirstResponder()
        }
    }
    
}



extension String {
    func substring(location index:Int, length:Int) -> String {
        if self.count > index {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let endIndex = self.index(self.startIndex, offsetBy: index + length)
            let subString = self[startIndex..<endIndex]
            return String(subString)
        } else {
            return self
        }
    }
}
