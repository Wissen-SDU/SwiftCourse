//
//  GalleryVC.swift
//  Ders6-2
//
//  Created by Suleyman Calik on 29.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

let reuseIdentifier = "GalleryCell"

class GalleryVC: UICollectionViewController, UIActionSheetDelegate {

    var multimedias:Array<AnyObject>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        multimedias = gorselleriAl()

        var btnAdd = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addMultimedia")
        self.navigationItem.rightBarButtonItem = btnAdd
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actionsheet MEthods
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        switch buttonIndex {
        case 1:
            openImagePicker(UIImagePickerControllerSourceType.PhotoLibrary)
        case 2 :
            openImagePicker(UIImagePickerControllerSourceType.Camera)
        default:
            println("Vazgec")
        }
    }
    
    
    // MARK: - Utility
    
    func openImagePicker(source:UIImagePickerControllerSourceType) {
        var imagePicker = UIImagePickerController()
        imagePicker.sourceType = source
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func addMultimedia() {
        
        if UIImagePickerController.isSourceTypeAvailable( UIImagePickerControllerSourceType.Camera)
        {
            var actionSheet = UIActionSheet(title: "Görsel Ekle", delegate: self, cancelButtonTitle: "Vazgeç", destructiveButtonTitle: nil, otherButtonTitles: "Galeri'den Al", "Kamera'dan Al")
            actionSheet.showInView(view)
        }
        else {
            openImagePicker(UIImagePickerControllerSourceType.PhotoLibrary)
        }
    }
    
    
    func gorselleriAl() -> Array<AnyObject>? {
        
        var gorseller:AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("gallery")
        return gorseller as? Array<AnyObject>
    }
    
    
    func gorselleriKaydet(gorseller:Array<AnyObject>?) {
        
        NSUserDefaults.standardUserDefaults().setObject(gorseller, forKey: "gallery")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        if multimedias == nil {
            return 0
        }
        else {
            return multimedias.count
        }
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as GalleryCell
    
        //
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
