//
//  ViewController.swift
//  Ders4-3
//
//  Created by Suleyman Calik on 27.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var manzaraScroll = UIScrollView()
    var manzaraImage:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        println("Viewcontroller viewDidLoad")

        loadUI()
    }

    
    func loadUI() {
        
        manzaraScroll.delegate = self
        
        var image = UIImage(named: "manzara")
        var imageView = UIImageView(image: image)
        
        var doubleTap = UITapGestureRecognizer(target: self, action: "doubleTapped:")
        doubleTap.numberOfTapsRequired = 2
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(doubleTap)
        
        manzaraImage = imageView
        manzaraScroll.addSubview(imageView)
        
        manzaraScroll.frame = view.bounds
        manzaraScroll.contentSize = image!.size
        
        manzaraScroll.bounces = false
        
        manzaraScroll.minimumZoomScale = 0.1
        manzaraScroll.maximumZoomScale = 1.5

        view.addSubview(manzaraScroll)
        
        ekranaSigdir()
    }
    
    
    func ekranaSigdir() {
        
        var imageSize = manzaraImage.image!.size
        var scrollSize = manzaraScroll.frame.size
        
        var widthRatio = scrollSize.width / imageSize.width
        var heightRatio = scrollSize.height / imageSize.height
        
        if imageSize.width > imageSize.height {
            manzaraScroll.zoomScale = widthRatio
        }
        else {
            manzaraScroll.zoomScale = heightRatio
        }
    }
    
    
    func doubleTapped(doubleTap:UITapGestureRecognizer) {
        
        if manzaraScroll.zoomScale == manzaraScroll.maximumZoomScale {
            manzaraScroll.setZoomScale(manzaraScroll.minimumZoomScale, animated: true)
        }
        else {
            var tapPoint = doubleTap.locationInView(manzaraImage)

            let scrollViewSize = manzaraScroll.bounds.size
            let w = scrollViewSize.width / manzaraScroll.maximumZoomScale
            let h = scrollViewSize.height / manzaraScroll.maximumZoomScale
            let x = tapPoint.x - (w / 2.0)
            let y = tapPoint.y - (h / 2.0)
            
            let rectToZoomTo = CGRectMake(x, y, w, h);
            
            manzaraScroll.zoomToRect(rectToZoomTo, animated: true)
        }
    }
    
    // Orientation(dikey-yatay) degisince bu method cagriliyor
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {

        manzaraScroll.frame.size = size
        ekranaSigdir()
        
    }
    
    
    // MARK: - ScrollView Methods
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return manzaraImage
    }


}










