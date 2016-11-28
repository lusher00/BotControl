//
//  ParameterControl.swift
//  BotControl
//
//  Created by Ryan Lush on 10/23/16.
//  Copyright © 2016 Ryan Lush. All rights reserved.
//

import UIKit

class ParameterControl: UIView {

    private var name : UILabel!
    private var val : UITextField!
    private var delta : UITextField!
    private var stepper : UIStepper!
    var button : UIButton!
    
    init(frame: CGRect, albumCover: String) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func send(){
        
    }

    func doSomething(){//sender: UIButton){
        print("doSometing")
    }

    
    func commonInit(){
        
        name = UILabel()
        name.text = "*"
        
        val = UITextField.init()
        val.text = "0.0"
        delta = UITextField.init()
        delta.text = "0.0"
        stepper = UIStepper.init()
        button = UIButton.init()
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(self.doSomething), for: UIControlEvents.touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [name, val, delta, button, stepper])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)

        let viewsDictionary = ["stackView":stackView]
        let stackView_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[stackView]-5-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let stackView_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[stackView]-5-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        self.addConstraints(stackView_H)
        self.addConstraints(stackView_V)
        

        
    }

    

}
