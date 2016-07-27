//
//  ViewController.swift
//  Shopping
//
//  Created by Tony.Jin on 7/27/16.
//  Copyright © 2016 Innovatis Tech. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let auth = LAContext()
        var authError: NSError?
        
        if auth.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &authError)
        {
            auth.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Secure Login", reply: {(success,policerror) -> Void in
                
                if success
                {
                    print("login")
                    self.performSegueWithIdentifier("sunny", sender: self)
                }else
                {
                    print("kkkk")
                }
                
            })
        }else
        {
            print(authError?.localizedDescription)
            
        }
        print("jjj")
    }

    
   
    



}

