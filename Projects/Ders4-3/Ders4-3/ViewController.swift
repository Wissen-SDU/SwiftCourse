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

        loadUI()
    }

    
    func loadUI() {
        
        manzaraScroll.delegate = self
        
        var image = UIImage(named: "manzara")
        var imageView = UIImageView(image: image)
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










