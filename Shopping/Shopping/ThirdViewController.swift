//
//  ThirdViewController.swift
//  Shopping
//
//  Created by Tony.Jin on 7/27/16.
//  Copyright © 2016 Innovatis Tech. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    let cartButton : MIBadgeButton = MIBadgeButton(frame: CGRectMake(0, 0, 40, 40))
    var count:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartButton.setImage(UIImage(named: "ios7-cart-1"), forState: .Normal)
        let barButton : UIBarButtonItem = UIBarButtonItem(customView: cartButton)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @IBAction func buttonAction1(sender: AnyObject) {
        count = count + 1
        cartButton.badgeString = "\(count)"
    }
    
    @IBAction func buttonAction2(sender: AnyObject) {
        count = count + 1
        cartButton.badgeString = "\(count)"
    }
    
    
    @IBAction func buttonAction3(sender: AnyObject) {
        count = count + 1
        cartButton.badgeString = "\(count)"
    }
    
    @IBAction func buttonAction4(sender: AnyObject) {
        count = count + 1
        cartButton.badgeString = "\(count)"
    }
    
    @IBAction func buttonAction5(sender: AnyObject) {
        count = count + 1
        cartButton.badgeString = "\(count)"
    }

    
    
}
