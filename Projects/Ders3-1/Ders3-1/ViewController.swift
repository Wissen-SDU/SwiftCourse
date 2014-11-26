//
//  ViewController.swift
//  Ders3-1
//
//  Created by Suleyman Calik on 26.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class Temp {
    
//    var student = ViewController.Student(name: "Denme", number: 1)
}


 class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    struct Student {
        var name:String
        var lastName:String
        var number:Int
        
        var _fullName:String?
        
        mutating func fullName() -> String {
            if _fullName == nil {
                _fullName = name + " " + lastName
            }
            return _fullName!
        }
    }

    
    @IBOutlet weak var tableView: UITableView!
    var students = Array<Student>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 0..<300 {
            students.append(Student(name: "Ogrenci\(i)", lastName:"soyad", number: 100+i, _fullName:nil))
        }

        tableView.dataSource = self
        tableView.delegate = self
    }

    
    // MARK: - TableView Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return students.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCellWithIdentifier("StudentCell") as UITableViewCell

        var student = students[indexPath.row]
        cell.textLabel.text = student.fullName()
        cell.detailTextLabel?.text = String(student.number)
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var student = students[indexPath.row]
        var alertController = UIAlertController(title: "Secilen Ogrenci", message: student.name, preferredStyle: UIAlertControllerStyle.Alert)
        
        var cancelAction = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }

}








