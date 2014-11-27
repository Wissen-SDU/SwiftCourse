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
                    // hic bir degisiklik yapmamis
                }
                else {
                    // degisiklik yapmis
                }
            }
            else {
                // yeni bir alarm ekliyor
            }
        }
        
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
