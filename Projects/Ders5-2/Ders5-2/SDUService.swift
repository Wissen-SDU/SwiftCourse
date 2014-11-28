//
//  SDUService.swift
//  Ders5-2
//
//  Created by Suleyman Calik on 28.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

private var _sharedService:SDUService?

typealias DictinaryHandler = (Dictionary<String,AnyObject>) -> Void


class SDUService: NSObject {
   
    private let urlString = "https://bidibidi.com"
    private let methodLogin = "KimlikGirisJson"
    
    class func sharedService() -> SDUService {
        if _sharedService == nil {
            _sharedService = SDUService()
        }
        return _sharedService!
    }
    
    
    func login(email:String, password:String , userType:Int = 1 , handler:(dict:Dictionary<String,AnyObject>!) -> Void) {
        var url = NSURL(string: urlString + methodLogin)
        if let loginURL = url {
            var request:NSMutableURLRequest = NSMutableURLRequest(URL: loginURL)
            request.HTTPMethod = "POST"

            var dict = [
                "kimlikEPosta" : email,
                "kimlikSifre"  : password,
                "girisTurKodu" : userType]
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.HTTPBody = NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.allZeros, error: nil)
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                if error == nil {
                    if let userData = data {
                        
                        let jsonObject:AnyObject! = NSJSONSerialization.JSONObjectWithData(userData, options: NSJSONReadingOptions(0), error: nil)
                        handler(dict:jsonObject as Dictionary<String,AnyObject>)
                        
                    }
                    else {
                        println("data olusmadi!")
                        handler(dict:nil)
                    }
                }
                else {
                    println(error!)
                    handler(dict:nil)
                }
            })
            
        }
        else {
            print("url olusturulamadi!")
            handler(dict:nil)
        }
    }
}







