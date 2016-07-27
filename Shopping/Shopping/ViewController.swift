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

    @IBOutlet weak var coverView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coverView.hidden = true
        
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: #selector(self.viewCover), name:"viewChange" , object: nil)
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func viewCover(){
        UIView.animateWithDuration(2.0) {
            self.coverView.hidden = false
        }

    }
    

    func anthenficate(){
        
        let auth = LAContext()
        var authError: NSError?
        
        if auth.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &authError){
            auth.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Secure Login", reply: {(success,policerror) -> Void in
                
                if success{
                    print("login")
                    self.performSegueWithIdentifier("sunny", sender: self)
                }else{
                    print("falure")
                }
            })
        }else{
            print(authError?.localizedDescription)
        }
        
    }

    
    @IBAction func loginButtonAction(sender: AnyObject) {
        
        let popview = UIStoryboard(name: "Pop", bundle: nil).instantiateInitialViewController()
        popview?.transitioningDelegate = self
        popview?.modalPresentationStyle = UIModalPresentationStyle.Custom
        popview?.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(popview!, animated: true, completion: nil)
        
        anthenficate()
        
        NSNotificationCenter.defaultCenter().postNotificationName("viewChange", object: self)
 
    }

}


extension ViewController: UIViewControllerTransitioningDelegate{
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?
    {
        return PresentationController(presentedViewController: presented, presentingViewController: presenting)
    }

}

