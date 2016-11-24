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
    
    @IBOutlet var connectionStatusLabel: UILabel!
    
    var timerTXDelay: Timer?
    var allowTX = true
    var lastPosition: UInt8 = 255
    var dataIn = String()
    var offset: CGFloat = 0
    
    var artificialHorizon: UIView!
    var data: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Watch Bluetooth connection
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.connectionChanged(_:)), name: NSNotification.Name(rawValue: BLEServiceChangedStatusNotification), object: nil)

        // Watch Bluetooth connection
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.dataReceived(_:)), name: NSNotification.Name(rawValue: BLEDataChangedStatusNotification), object: nil)

        // Start the Bluetooth discovery process
        btDiscoverySharedInstance
        
        artificialHorizon = ArtificalHorizon()
        
        
        
        self.data = Data()
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
            if let strData: String = userInfo["data"] {
                
                self.data.parse(data: strData)
                
                let angle = self.data.getAngle()
                
                artificialHorizon.
                
                let tString = angle.fixedFractionDigits(digits: 3)
                
                print(tString)
                
            }
        });
    }
    
    
    func sendData(_ str: String) {
        
        // Send position to BLE Shield (if service exists and is connected)
        if let bleService = btDiscoverySharedInstance.bleService
        {
            bleService.writeData(str)
        }
    }
    
    @IBAction func send(_ sender: AnyObject) {
        sendData("Hello World!")
    }
    
}


extension Double {
    func fixedFractionDigits(digits: Int) -> String {
        return String(format: "%.\(digits)f", self)
    }
}
