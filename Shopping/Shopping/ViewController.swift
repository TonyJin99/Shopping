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
    var isPresent = true
    
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
//                    print("login")
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.performSegueWithIdentifier("sunny", sender: self)
                }else{
//                    print("falure")
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
        presentViewController(popview!, animated: true, completion: nil)
        
        anthenficate()
        NSNotificationCenter.defaultCenter().postNotificationName("viewChange", object: self)
 
    }
}


extension ViewController: UIViewControllerTransitioningDelegate{
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?{
        return PresentationController(presentedViewController: presented, presentingViewController: presenting)
    }

//    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?{
//        return self
//    }
//    
//    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
//        return self
//    }

}


//extension ViewController: UIViewControllerAnimatedTransitioning{
//    
//    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
//        return 0.5
//    }
//    
//  
//    func animateTransition(transitionContext: UIViewControllerContextTransitioning){
//        if isPresent{
//            guard let toView = transitionContext.viewForKey(UITransitionContextToViewKey) else{
//                return
//            }
//            
//            transitionContext.containerView()?.addSubview(toView)
//            
//            toView.transform = CGAffineTransformMakeScale(1.0, 0.0)
//            toView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0) //设置锚点
//            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
//                toView.transform = CGAffineTransformIdentity
//            }) { (_) in
//                transitionContext.completeTransition(true)
//            }
//        }
//        else{
//            guard let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey) else{
//                return
//            }
//            
//            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
//                fromView.transform = CGAffineTransformMakeScale(1.0, 0.0000001)
//            }) { (_) in
//                transitionContext.completeTransition(true)
//            }
//            
//        }
//        
//    }
//}

















