//
//  ParameterControl.swift
//  BotControl
//
//  Created by Ryan Lush on 10/23/16.
//  Copyright © 2016 Ryan Lush. All rights reserved.
//

import UIKit

class ParameterControl: UIView {

    private var stepper : UIStepper!
    private var textField : UITextField!
    private var btn : UIButton!
    
    init(frame: CGRect, albumCover: String) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
