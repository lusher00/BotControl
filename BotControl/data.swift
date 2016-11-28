//
//  data.swift
//  BotControl
//
//  Created by Ryan Lush on 10/25/16.
//  Copyright © 2016 Ryan Lush. All rights reserved.
//

import Foundation

class Data {
    
    private var angle : Double!
    
    private var zeroAng : Parameter
    private var pGain : Parameter
    private var iGain : Parameter
    private var dGain : Parameter
    private var cGain : Parameter
    
    private var dataIn : String
    
    init(){

        angle = 0.0
        
        zeroAng = Parameter(param: 0.0, name: "Zero Angle")
        pGain = Parameter(param: 0.0, name: "P Gain")
        iGain = Parameter(param: 0.0, name: "I Gain")
        dGain = Parameter(param: 0.0, name: "D Gain")
        cGain = Parameter(param: 0.0, name: "C Gain")
        
        
        dataIn = String()
    }
    
    func parse(data : String){
    
        self.dataIn += data
        
        if(self.dataIn.contains("\r\n")){
            var dataArray = self.dataIn.components(separatedBy: "\r\n")
            
            self.handleData(dataArray[0])
            
            if(dataArray.count > 1){
                self.dataIn = dataArray[1]
            }else{
                self.dataIn = ""
            }
        }
    }
    
    func handleData(_ data: String)
    {
        let dataArray = data.components(separatedBy: "; ")
        
        switch dataArray[0] {
            case "PARAMS":
                if dataArray.count == Int(dataArray[1])! + 1{
                    pGain.val = Double(dataArray[2])
                    iGain.val = Double(dataArray[3])
                    dGain.val = Double(dataArray[4])
                    zeroAng.val = Double(dataArray[5])
                }
            case "UPDATE":
                if dataArray.count == Int(dataArray[1])! + 1{
                    angle = Double(dataArray[2])
                }
                break
            default :
                break
        }
        
    }

    func getAngle() -> Double{
        return angle
    }
}




class Parameter {
    
    var val : Double!
    var delta : Double!
    var friendly_name : String!
    
    init(param : Double, name : String){
        self.friendly_name = name
        self.val = param
        self.delta = 0.1
    }
    
    func getVal() -> Double{
        return self.val
    }
    
    func setVal(val : Double){
        self.val = val
    }
    
    func increment() -> Double{
        self.val = self.val + self.delta
        
        return self.val
    }

    func deccrement() -> Double{
        self.val = self.val - self.delta
        
        return self.val
    }
}
