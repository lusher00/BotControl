//
//  data.swift
//  BotControl
//
//  Created by Ryan Lush on 10/25/16.
//  Copyright © 2016 Ryan Lush. All rights reserved.
//

import Foundation

class Data {
    
    private var angle : Double
    
    private var pGain : Double
    private var iGain : Double
    private var dGain : Double
    
    private var dataIn : String
    
    init(){
        angle = 0.0
        
        pGain = 0.0
        iGain = 0.0
        dGain = 0.0
        
        dataIn = String()
    }
    
    func parse(data : String){
    
        self.dataIn += data
        
        if(self.dataIn.contains("\r\n")){
            var dataArray = self.dataIn.components(separatedBy: "\r\n")
            angle = self.handleData(dataArray[0])
            
            if(dataArray.count > 1){
                self.dataIn = dataArray[1]
            }else{
                self.dataIn = ""
            }
        }
    }
    
    func handleData(_ data: String) -> Double
    {
        let dataArray = data.components(separatedBy: "; ")
        
        if let angle = Double(dataArray[2]){
            return angle
        } else {
            return 0.0
        }
        
    }

    func getAngle() -> Double{
        return angle
    }
}
