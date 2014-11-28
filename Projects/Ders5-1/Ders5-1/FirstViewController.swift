//
//  FirstViewController.swift
//  Ders5-1
//
//  Created by Suleyman Calik on 28.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Realm

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
            var url = NSURL(string: "https://graph.facebook.com/\(txtUsername.text)")
            var request = NSURLRequest(URL: url!)
            
            SVProgressHUD.show()
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in

                SVProgressHUD.dismiss()
                
                
                if let userData = data {
                    
                    let jsonObject:AnyObject! = NSJSONSerialization.JSONObjectWithData(userData, options: NSJSONReadingOptions(0), error: nil)
                    
                    if let userId:AnyObject = jsonObject.objectForKey("id") {
                        let realm = RLMRealm.defaultRealm()
                        realm.beginWriteTransaction()
                        var newUser = User.createOrUpdateInDefaultRealmWithObject(jsonObject)
                        realm.commitWriteTransaction()
                        
                        
                        if newUser != nil {
                            self.lblMessage.text = "Kullanici basariyla kaydedildi: \(newUser.name)"
                            self.lblMessage.textColor = UIColor.greenColor()
                        }
                        else {
                            self.lblMessage.text = "Kullanici bulunamadi! : \(self.txtUsername.text)"
                            self.lblMessage.textColor = UIColor.redColor()
                        }
                    }
                    else {
                        self.lblMessage.text = "Kullanici bulunamadi! : \(self.txtUsername.text)"
                        self.lblMessage.textColor = UIColor.redColor()
                    }

                }
                else {
                    println(error)
                }
                
            })
        }
        
    }

}






