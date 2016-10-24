//
//  ArtificalHorizon.swift
//  BotControl
//
//  Created by Ryan Lush on 10/20/16.
//  Copyright © 2016 Ryan Lush. All rights reserved.
//

import UIKit

class ArtificalHorizon: UIView {

    private var imgHorizon : UIImage!
    private var imgBezel : UIImage!
    private var imgWings : UIImage!
    
    private var imgViewHorizon : UIImageView!
    private var imgViewBezel : UIImageView!
    private var imgViewWings : UIImageView!
    
    private var svHorizon : UIScrollView!
   
    private var offsetForZeroAngle : CGFloat!
    
    private var sf : CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //commonInit()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    func commonInit(){
        self.clipsToBounds = true

        let screenRect : CGRect  = self.frame
        let screenWidth : CGFloat  = screenRect.size.width;
        let screenHeight : CGFloat  = screenRect.size.height;
        
        imgHorizon = UIImage.init(named:"horizon")!
        imgBezel = UIImage.init(named:"bezel_transparent")!
        imgWings = UIImage.init(named:"wings_transparent")!
        
        imgViewHorizon = UIImageView.init()
        imgViewBezel = UIImageView.init()
        imgViewWings = UIImageView.init()
        
        svHorizon = UIScrollView.init()
        
        // Figure out how much we need to scale the horizon image
        sf = screenWidth / imgHorizon.size.width
        let horizonImgWidth = imgHorizon.size.width * sf
        let horizonImgHeight = imgHorizon.size.height * sf
        
        imgViewHorizon = UIImageView(frame: CGRect(x: 0, y: 0, width: horizonImgWidth, height: horizonImgHeight))
        imgViewHorizon.contentMode = UIViewContentMode.scaleAspectFill
        imgViewHorizon.clipsToBounds = true
        imgViewHorizon.image = imgHorizon
        imgViewHorizon.backgroundColor = UIColor.red
        
        imgViewBezel = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth))
        imgViewBezel.contentMode = UIViewContentMode.scaleAspectFill
        imgViewBezel.clipsToBounds = true
        imgViewBezel.image = imgBezel
        
        imgViewWings = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth))
        imgViewWings.contentMode = UIViewContentMode.center
        imgViewWings.clipsToBounds = true
        imgViewWings.image = imgWings
        
        svHorizon = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth))
        svHorizon.contentSize = CGSize(width: horizonImgWidth, height: horizonImgHeight)
        svHorizon.contentMode = UIViewContentMode.scaleAspectFill
        svHorizon.bounces = false
        svHorizon.backgroundColor = UIColor.cyan
        
        offsetForZeroAngle = CGFloat((horizonImgHeight - svHorizon.frame.height) / 2)
        updateAngle(angle: 10.0)
        
        print(svHorizon.contentOffset)
        print(svHorizon.contentSize)
        print(svHorizon.frame.origin)
        print(imgViewHorizon.frame.origin)
        print(screenRect)
        
        svHorizon.addSubview(imgViewHorizon)
        addSubview(svHorizon)
        addSubview(imgViewBezel)
        addSubview(imgViewWings)

    }
    
    func updateAngle(angle : Double){
        svHorizon.contentOffset.y = offsetForZeroAngle + CGFloat(angle * -4.0 * Double(sf))
    }
    
 
    
    /*
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: imgBezel.size.width, height: imgHorizon.size.height)
    }
    */


}
