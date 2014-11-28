//
//  AlarmVC.swift
//  Ders4-4
//
//  Created by Suleyman Calik on 27.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class AlarmVC: UIViewController {
    
    var alarm:Alarm?

    @IBOutlet weak var txtAlarm: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let currentalarm = alarm {
            txtAlarm.text = currentalarm.title
            datePicker.date = currentalarm.date
        }
        
        txtAlarm.becomeFirstResponder()
        datePicker.minimumDate = NSDate()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Kaydet", style: UIBarButtonItemStyle.Done, target: self, action: "saveTapped")
    }

    func saveTapped() {
        
        if txtAlarm.text.isEmpty {
            SVProgressHUD.showErrorWithStatus("Alarm Basligi Girin!")
        }
        else {
            if let currentalarm = alarm {
                
                if txtAlarm.text == currentalarm.title && datePicker.date == currentalarm.date {
                    // hicbir degisiklik yapmamis
                }
                else {
                    // degisiklik yapmis
                    currentalarm.title = txtAlarm.text
                    currentalarm.date = datePicker.date
                }
            }
            else {
                
                // yeni bir alarm ekliyor
//                var newAlarm = Alarm(title: txtAlarm.text, date: datePicker.date)
//                alarms.append(newAlarm)
                
                
                println("now: \(NSDate())")
                println("noti date: \(datePicker.date)")
                
                fireLocalNotification(txtAlarm.text, date: datePicker.date)
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
    
    func fireLocalNotification(title:String, date:NSDate) {
        
        var settings = UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert | UIUserNotificationType.Badge, categories:nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)

        var notification = UILocalNotification()
        notification.alertBody = title
        
        notification.fireDate = date
        notification.applicationIconBadgeNumber++
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
