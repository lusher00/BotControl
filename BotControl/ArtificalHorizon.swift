//
//  ArtificalHorizon.swift
//  BotControl
//
//  Created by Ryan Lush on 10/20/16.
//  Copyright © 2016 Ryan Lush. All rights reserved.
//

import UIKit

class ArtificalHorizon: UIView {

    private var imgHorizon : UIImage
    private var imgBezel : UIImage
    private var imgWings : UIImage
    
    private var imgViewHorizon : UIImageView
    private var imgViewBezel : UIImageView
    private var imgViewWings : UIImageView
    
    private var svHorizon : UIScrollView
   
    
    required init?(coder aDecoder: NSCoder) {
        
        imgHorizon = UIImage.init(named:"horizon")!
        imgBezel = UIImage.init(named:"bezel_transparent")!
        imgWings = UIImage.init(named:"wings_transparent")!
        
        imgViewHorizon = UIImageView.init()
        imgViewBezel = UIImageView.init()
        imgViewWings = UIImageView.init()
        
        svHorizon = UIScrollView.init()
        
        super.init(coder: aDecoder)
        
        //self.clipsToBounds = true
        
        imgViewHorizon = UIImageView(frame: CGRect(x: 0, y: 0, width: imgBezel.size.width, height: imgHorizon.size.height))
        //imgViewHorizon.contentMode = UIViewContentMode.scaleAspectFill
        imgViewHorizon.clipsToBounds = true
        //imgViewHorizon.image = imgHorizon
        imgViewHorizon.backgroundColor = UIColor.red
        
        imgViewBezel = UIImageView(frame: CGRect(x: 0, y: 0, width: imgBezel.size.width, height: imgBezel.size.height))
        imgViewBezel.contentMode = UIViewContentMode.center
        imgViewBezel.clipsToBounds = true
        imgViewBezel.image = imgBezel
        
        imgViewWings = UIImageView(frame: CGRect(x: 0, y: 0, width: imgBezel.size.width, height: imgBezel.size.height))
        imgViewWings.contentMode = UIViewContentMode.center
        imgViewWings.clipsToBounds = true
        imgViewWings.image = imgWings
        
        svHorizon = UIScrollView(frame: CGRect(x: 0, y: 0, width: imgBezel.size.width, height: imgBezel.size.width))
        svHorizon.contentSize = CGSize(width: imgBezel.size.width, height: imgHorizon.size.height)
        svHorizon.contentMode = UIViewContentMode.scaleToFill
        svHorizon.bounces = false
        svHorizon.backgroundColor = UIColor.cyan
        svHorizon.contentOffset = CGPoint(x: 0, y: 0)
        //svHorizon.contentOffset = CGPoint(x: (imgBezel.size.width - svHorizon.frame.width) / 2, y: (imgHorizon.size.height - svHorizon.frame.height) / 2)
        
        print(svHorizon.contentOffset)
        print(svHorizon.contentSize)
        print(svHorizon.frame.origin)
        print(imgViewHorizon.frame.size)
        
//        addSubview(imgViewHorizon)
        svHorizon.addSubview(imgViewHorizon)
        addSubview(svHorizon)
//        addSubview(imgViewBezel)
//        addSubview(imgViewWings)
    }
    
    
    /*
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: imgBezel.size.width, height: imgHorizon.size.height)
    }
    */


}
