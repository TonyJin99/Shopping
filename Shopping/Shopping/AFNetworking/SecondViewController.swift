//
//  SecondViewController.swift
//  Shopping
//
//  Created by Tony.Jin on 7/27/16.
//  Copyright © 2016 Innovatis Tech. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pagecontrol: UIPageControl!
    
    var timer: NSTimer? = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollPictures()
   
    
    }

}


extension SecondViewController: UIScrollViewDelegate{
    
    func scrollPictures() {
        
        let imageW = self.view.frame.size.width - 40
        let imageH = CGFloat(220)
        let imageY = CGFloat(0)
        
        for i in 0..<4 {
            let imageview = UIImageView()
            let imageName = String(format: "shutterstock_%d", i)
            imageview.image = UIImage(named: imageName)
            let imageX = CGFloat(i) * imageW
            imageview.frame = CGRectMake(imageX, imageY, imageW, imageH)
            
            self.scrollView.addSubview(imageview)
        }
        
        let maxX = self.scrollView.frame.size.width * 4
        self.scrollView.contentSize = CGSizeMake(maxX, 0)
        
        self.scrollView.pagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        
        self.pagecontrol.numberOfPages = 4
        self.pagecontrol.currentPage = 0
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: #selector(SecondViewController.scrollImage), userInfo: nil, repeats: true)
        
        let runloop = NSRunLoop.currentRunLoop()
        runloop.addTimer(self.timer!, forMode: NSRunLoopCommonModes)
        
    }
    
    
    func scrollImage() {
        var page = self.pagecontrol.currentPage
        if page == self.pagecontrol.numberOfPages - 1 {
            page = 0
        }else{
            page += 1
        }
        let offsetX = CGFloat(page) * self.scrollView.frame.size.width
        self.scrollView.setContentOffset(CGPointMake(offsetX, 0), animated: true)
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offsetX = scrollView.contentOffset.x
        offsetX = offsetX + (scrollView.frame.size.width * CGFloat(0.5))
        let page = Int(offsetX / scrollView.frame.size.width)
        self.pagecontrol.currentPage = page
    }
    
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.timer!.invalidate()
        self.timer = nil
    }
    
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: #selector(SecondViewController.scrollImage), userInfo: nil, repeats: true)
        }
}

