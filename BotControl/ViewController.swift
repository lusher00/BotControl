//
//  ViewController.swift
//  Arduino_Servo
//
//  Created by Owen L Brown on 9/24/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit
import Foundation

let viewControllerSharedInstance = ViewController()

class ViewController: UIViewController {
    
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var connectionStatusLabel : UILabel!
    @IBOutlet var myScrollView: UIScrollView!

    
    var timerTXDelay: Timer?
    var allowTX = true
    var lastPosition: UInt8 = 255
    var dataIn = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myScrollView.contentSize = CGSize(width: 300, height: 720)
        self.myScrollView.contentOffset = CGPoint(x: (300 - self.myScrollView.frame.width) / 2,
                                                  y: (720 - self.myScrollView.frame.height) / 2)
        
        print(self.myScrollView.frame.width)
        print(self.myScrollView.frame.height)
        print(self.myScrollView.contentSize)
        print(self.myScrollView.contentOffset)

        // Watch Bluetooth connection
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.connectionChanged(_:)), name: NSNotification.Name(rawValue: BLEServiceChangedStatusNotification), object: nil)
        
        // Start the Bluetooth discovery process
        btDiscoverySharedInstance
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: BLEServiceChangedStatusNotification), object: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func connectionChanged(_ notification: Notification) {
        // Connection status changed. Indicate on GUI.
        let userInfo = (notification as NSNotification).userInfo as! [String: Bool]
        
        DispatchQueue.main.async(execute: {
            // Set image based on connection status
            if let isConnected: Bool = userInfo["isConnected"] {
                if isConnected {
                    self.connectionStatusLabel.text = "Connected"
                    self.connectionStatusLabel.textColor = UIColor.green
                } else {
                    self.connectionStatusLabel.text = "Disconnected"
                    self.connectionStatusLabel.textColor = UIColor.red
                }
            }
        });
    }
    
    func dataReceived(_ notification: Notification){
        let userInfo = (notification as NSNotification).userInfo as! [String: String]
        
        DispatchQueue.main.async(execute: {
            // Set image based on connection status
            if let data: String = userInfo["data"] {
                
                self.dataIn += data
                
                if(self.dataIn.contains("\r\n")){
                    var dataArray = self.dataIn.components(separatedBy: "\r\n")
                    let tString = self.handleData(dataArray[0]).fixedFractionDigits(digits: 3)
                    self.textBox.text = tString
                    
                    print(tString)
                    
                    
                    if(dataArray.count > 1)
                    {
                        self.dataIn = dataArray[1]
                    }
                    else
                    {
                        self.dataIn = ""
                    }
                }
                
            }
        });
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
}


extension Double {
    func fixedFractionDigits(digits: Int) -> String {
        return String(format: "%.\(digits)f", self)
    }
}
