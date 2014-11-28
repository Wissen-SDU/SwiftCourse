//
//  FirstViewController.swift
//  Ders5-1
//
//  Created by Suleyman Calik on 28.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getirTapped(sender: UIButton) {
        
        if !txtUsername.text.isEmpty {
            var url = NSURL(string: "http://graph.facebook.com/\(txtUsername.text)")
            var request = NSURLRequest(URL: url!)
            
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in

                if let userData = data {
                    var dataText:NSString = NSString(data:userData, encoding: NSUTF8StringEncoding)!
                    println(dataText)
                }
                else {
                    println(error)
                }
                
            })
        }
        
    }

}






