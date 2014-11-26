//
//  ViewController.swift
//  Ders3-1
//
//  Created by Suleyman Calik on 26.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Haneke


 class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    class Student {
        var name:String
        var lastName:String
        var number:Int
        var image:UIImage?
        
        private var _fullName:String?
        
        init(name:String, lastName:String, number:Int) {
            self.name = name
            self.lastName = lastName
            self.number = number
        }
        
        func fullName() -> String {
            if _fullName == nil {
                _fullName = name + " " + lastName
            }
            return _fullName!
        }
    }

    
    @IBOutlet weak var tableView: UITableView!
    var students = Array<Student>()
    let studentDetailSegue = "ShowStudentDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for i in 0..<300 {
            students.append(Student(name: "Ogrenci\(i)", lastName:"soyad", number: 4+i))
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
        
        if let image = student.image {
            cell.imageView.image = image
        }
        else {
            var tempImage = UIImage(named: "ogrenci")
            cell.imageView.image = tempImage
            cell.imageView.sizeToFit()
            
            var url = NSURL(string: "http://graph.facebook.com/\(student.number)/picture?type=square")
            if url !=  nil {
                cell.imageView.hnk_setImageFromURL(url!, placeholder: tempImage, format: nil, failure: nil, success: { (image) -> () in
                    student.image = image
                    cell.imageView.image = image
                })
            }
        }

        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        performSegueWithIdentifier(studentDetailSegue, sender:indexPath)
    }
    
    
    
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            var student = students[indexPath.row]
            
            // AlertController olustur
            var alertController = UIAlertController(title: "Silinecek Ogrenci", message: student.fullName(), preferredStyle: UIAlertControllerStyle.Alert)
            
            // Vazgec butonunu olustur
            var cancelAction = UIAlertAction(title: "Vazgec", style: UIAlertActionStyle.Cancel, handler: { (action) in
                tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
            })
            alertController.addAction(cancelAction)
            
            // Sil butonunu olustur
            var deleteAction = UIAlertAction(title: "Sil", style: UIAlertActionStyle.Destructive, handler: { (action) in
                self.students.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            })
            alertController.addAction(deleteAction)
            
            // alertController'i goster
            presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    
    // MARK: - Navigation Methods
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == studentDetailSegue {
            var indexPath = sender as NSIndexPath
            var student = students[indexPath.row]
            
            var destination = segue.destinationViewController as StudentDetailVC
            destination.student = student
        }
    }

}








