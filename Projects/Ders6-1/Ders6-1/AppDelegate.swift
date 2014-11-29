//
//  AppDelegate.swift
//  Ders6-1
//
//  Created by Suleyman Calik on 29.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var pushNotification:AnyObject?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.setApplicationId("FjfpSKoGBmZrCLCGZvAx6L9Q8EFPKljai6WbRZVa", clientKey: "BVm9lOAAS6q3v3p0h8RnX7zfYmi7u0bvjmjrdZqS")
        
        
        if !application.isRegisteredForRemoteNotifications() {
            
            application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert | UIUserNotificationType.Badge | UIUserNotificationType.Sound, categories: nil))
            application.registerForRemoteNotifications()
        }
        else {
            if launchOptions != nil {
                var noti: AnyObject? = launchOptions![UIApplicationLaunchOptionsRemoteNotificationKey]
                if let pushNoti:AnyObject = noti {
                    pushNotification = pushNoti
                }
            }
        }


        return true
    }
    
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        println(userInfo)
    }
    
    
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        PFInstallation.currentInstallation().setDeviceTokenFromData(deviceToken)
        PFInstallation.currentInstallation().saveInBackgroundWithBlock { (completed, error) -> Void in
            if completed {
                println("TOKEN gonderildi")
            }
            else {
                println("TOKEN gonderilemedi! :\(error)")
            }
        }
        
//        println(NSString(data: deviceToken, encoding: NSUTF8StringEncoding))
    }
    
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        println(notificationSettings)
    }
    
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        println("FAILED: \(error)")
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

