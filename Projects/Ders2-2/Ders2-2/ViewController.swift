//
//  ViewController.swift
//  Ders2-2
//
//  Created by Suleyman Calik on 25.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        maviViewEkle()
        sariViewEkle()
        
        /*
        for subview in view.subviews as [UIView] {
            
            var viewText = subview.tag == 10 ? "Mavi" : "Sari"
            println("View: \(viewText)")
            
            var frame = subview.frame
            println("frame: \(frame)")
            
            var bounds = subview.bounds
            println("bounds: \(bounds)")

            var center = subview.center
            println("center: \(center)")
            
        }
        */
    }

    
    func maviViewEkle() {
        var maviRect = CGRect(x:30, y:30, width:200, height:200)
        var maviView = UIControl(frame: maviRect)
        maviView.backgroundColor = UIColor.blueColor()
        maviView.tag = 10
        maviView.addTarget(self, action: "viewTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        
        maviView.clipsToBounds = true
        maviView.layer.cornerRadius = maviRect.width / 2
        
        view.addSubview(maviView)
        
        
        var redRect = CGRect(x: 20, y: 20, width: 300, height: 300)
        var redView = UIControl()
        redView.frame = redRect
        redView.backgroundColor = UIColor.redColor()
        redView.tag = 100
        redView.addTarget(self, action: "viewTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        maviView.addSubview(redView)
    }
    
    
    func sariViewEkle() {
        var yellowRect = CGRect(x:80, y:50, width:300, height:100)
        var yellowView = UIControl(frame: yellowRect)
        yellowView.backgroundColor = UIColor.yellowColor()
        yellowView.tag = 20
        yellowView.addTarget(self, action: "viewTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(yellowView)
    }
    
    
     // MARK: Actions
    
    func viewTapped(sender:UIControl) {
        
        var originalFrame = sender.frame
        
        
        /*
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            sender.frame = sender.superview!.bounds

        }) { (completed) -> Void in
            
        }
        */
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            sender.frame = sender.superview!.bounds
            }) { (completed) -> Void in
                
                UIView.animateWithDuration(1, animations: { () -> Void in
                    sender.frame = originalFrame
                })
        }

    }


}

