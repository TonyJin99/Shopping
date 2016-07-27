//
//  TJMainViewController.swift
//  Shopping
//
//  Created by Tony.Jin on 7/27/16.
//  Copyright © 2016 Innovatis Tech. All rights reserved.
//

import UIKit


class TJMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("222")
        let manager = AFHTTPSessionManager()
        
        let parameters = NSMutableDictionary()
        parameters["username"] = "Michael"
        parameters["grandTotal"] = "0"
        
        let url = "http://54.191.35.66:8181/pfchang/api/buy"
        manager.POST(url, parameters: parameters, progress: { (progress) in
            print(progress)
            }, success: { (dataTask, object) in
                print("sucess")
                print(object!["rewardPoints"])
            }) { (datatask, error) in
                print(error)
        }
        
      
        

    }

}
