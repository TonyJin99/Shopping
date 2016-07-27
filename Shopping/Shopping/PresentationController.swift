//
//  PresentationController.swift
//  Shopping
//
//  Created by Tony.Jin on 7/27/16.
//  Copyright © 2016 Innovatis Tech. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    override func containerViewWillLayoutSubviews() {
        let popX = CGFloat(50)
        let popY = UIScreen.mainScreen().bounds.height - 350
        let width = UIScreen.mainScreen().bounds.width - 100
        presentedView()?.frame = CGRect(x: popX, y: popY, width: width, height: 350)
        
    }
    
}
