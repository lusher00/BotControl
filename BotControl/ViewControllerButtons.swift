//
//  ViewControllerButtons.swift
//  Arduino_Servo
//
//  Created by Ryan Lush on 10/10/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

class ViewControllerButtons: UIViewController {
    @IBOutlet weak var send: UIButton!
    @IBOutlet weak var ang_stepper: UIStepper!
    @IBOutlet weak var ang: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func ang_step(_ sender: AnyObject) {
        self.ang.text = ang_stepper.value.fixedFractionDigits(digits: 3)
    }
    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
