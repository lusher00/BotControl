//
//  ArtificalHorizon.swift
//  BotControl
//
//  Created by Ryan Lush on 10/20/16.
//  Copyright © 2016 Ryan Lush. All rights reserved.
//

import UIKit

class ArtificalHorizon: UIView {

    private let imgHorizon = UIImage.init(named:"horizon")!
    private let imgBezel = UIImage.init(named:"bezel_transparent")!
    private let imgWings = UIImage.init(named:"wings_transparent")!
    
    private var imgViewHorizon : UIImageView
    private var imgViewBezel : UIImageView
    private var imgViewWings : UIImageView
    
    private var svHorizon : UIScrollView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    func didLoad() {
        //Place your initialization code here
        
        //I actually create & place constraints in here, instead of in
        //updateConstraints
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Custom manually positioning layout goes here (auto-layout pass has already run first pass)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        //Disable this if you are adding constraints manually
        //or you're going to have a 'bad time'
        //self.translatesAutoresizingMaskIntoConstraints = false
        
        //Add custom constraint code here
    }

    override func draw(_ rect: CGRect) {
        imgViewHorizon = UIImageView.init()
        imgViewHorizon = UIImageView(frame: CGRect(x: 0, y: 0, width: imgHorizon.size.width, height: imgHorizon.size.height))
        imgViewHorizon.contentMode = UIViewContentMode.center
        imgViewHorizon.clipsToBounds = true
        imgViewHorizon.image = imgHorizon
        
        svHorizon = UIScrollView(frame: CGRect(x: 0, y: 0, width: imgHorizon.size.width, height: imgHorizon.size.width))
        svHorizon.contentSize = CGSize(width: imgHorizon.size.width, height: imgHorizon.size.height)
        svHorizon.center = self.center
        svHorizon.contentOffset = CGPoint(x: (imgHorizon.size.width - svHorizon.frame.width) / 2,
                                                  y: (imgHorizon.size.height - svHorizon.frame.height) / 2)
        
        svHorizon.addSubview(imgViewHorizon)
        self.addSubview(svHorizon)

    }

}
