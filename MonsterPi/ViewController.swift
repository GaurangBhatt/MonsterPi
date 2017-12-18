//
//  ViewController.swift
//  Light
//
//  Created by Bhatt, Gaurang on 11/30/17.
//  Copyright © 2017 Bhatt, Gaurang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var rightTurnBtn: UIButton!
    @IBOutlet weak var leftTurnBtn: UIButton!
    @IBOutlet weak var reverseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forwardBtn.layer.cornerRadius = 10
        rightTurnBtn.layer.cornerRadius = 10
        leftTurnBtn.layer.cornerRadius = 10
        reverseBtn.layer.cornerRadius = 10
        
        // Forward button
        let forwardBtnLongPress = UILongPressGestureRecognizer(target: self, action:#selector(moveForwardPressed(_:)))
        
        forwardBtn.addTarget(self, action:#selector(moveForwardTap(_:)), for: .touchDown)
        forwardBtn.addTarget(self, action:#selector(moveForwardReleased(_:)), for: .touchUpInside)
        forwardBtn.addGestureRecognizer(forwardBtnLongPress)
        
        // Reverse Button
        let reverseBtnLongPress = UILongPressGestureRecognizer(target: self, action:#selector(moveReversePressed(_:)))
        reverseBtn.addTarget(self, action:#selector(moveReverseTap(_:)), for: .touchDown)
        reverseBtn.addTarget(self, action:#selector(moveReverseReleased(_:)), for: .touchUpInside)
        reverseBtn.addGestureRecognizer(reverseBtnLongPress)
        
        // Turn right Button
        let rightBtnLongPress = UILongPressGestureRecognizer(target: self, action:#selector(turnRightPressed(_:)))
        
        rightTurnBtn.addTarget(self, action:#selector(turnRightTap(_:)), for: .touchDown)
        rightTurnBtn.addTarget(self, action:#selector(turnRightReleased(_:)), for: .touchUpInside)
        rightTurnBtn.addGestureRecognizer(rightBtnLongPress)
        
        // Turn left Button
        let leftBtnLongPress = UILongPressGestureRecognizer(target: self, action:#selector(turnLeftPressed(_:)))
        
        leftTurnBtn.addTarget(self, action:#selector(turnLeftTap(_:)), for: .touchDown)
        leftTurnBtn.addTarget(self, action:#selector(turnLeftRelesed(_:)), for: .touchUpInside)
        leftTurnBtn.addGestureRecognizer(leftBtnLongPress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func invokeWebIoPI(){
        let username = "webiopi"
        let password = "raspberry"
        let loginData = String(format: "%@:%@", username, password).data(using:String.Encoding.utf8)!
        let base64LoginData = loginData.base64EncodedString()
        
        // create the request
        let url = URL(string: "http://192.168.1.15:8000/macros/forward")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Basic \(base64LoginData)", forHTTPHeaderField: "Authorization")
        
        //making the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse {
                // check status code returned by the http server
                print("status code = \(httpStatus.statusCode)")
                // process result
            }
        }
        task.resume()
    }
    
    // forward button
    @IBAction func moveForwardReleased(_ sender: UIButton)
    {
        print("moving forward released!!")
    }
    
    @IBAction func moveForwardPressed(_ sender: UIButton)
    {
        print("moving forward pressed!!")
    }
    
    @IBAction func moveForwardTap(_ sender: UIButton)
    {
        print("moving forward tap!!")
        invokeWebIoPI()
    }
    
    // reverse button
    @IBAction func moveReverseReleased(_ sender: UIButton) {
        print("moving reverse released!!")
    }
    
    @IBAction func moveReversePressed(_ sender: UIButton) {
        print("moving reverse pressed!!")
    }
    
    @IBAction func moveReverseTap(_ sender: UIButton) {
        print("moving reverse tap!!")
    }
    
    // right button
    @IBAction func turnRightReleased(_ sender: UIButton) {
        print("Turn Right Released!!")
    }
    
    @IBAction func turnRightPressed(_ sender: UIButton) {
        print("Turn Right Pressed!!")
    }
    
    @IBAction func turnRightTap(_ sender: UIButton) {
        print("Turn Right Tap!!")
    }
    
    // left button
    @IBAction func turnLeftRelesed(_ sender: UIButton) {
        print("Turn Left Released!!")
    }
    
    @IBAction func turnLeftPressed(_ sender: UIButton) {
        print("Turn Left Pressed!!")
    }
    
    @IBAction func turnLeftTap(_ sender: UIButton) {
        print("Turn Left Tap!!")
    }
}

