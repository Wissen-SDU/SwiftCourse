//
//  ViewController.swift
//  Ders6-3
//
//  Created by Suleyman Calik on 29.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    var moviePlayer = MPMoviePlayerController(contentURL: NSBundle.mainBundle().URLForResource("nasa", withExtension: "mp4"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blackColor()
        showMovie()
    }

    
    func showMovie() {
        
        moviePlayer.movieSourceType = MPMovieSourceType.File
        moviePlayer.controlStyle = MPMovieControlStyle.Fullscreen
        moviePlayer.view.frame = view.bounds
        moviePlayer.repeatMode = MPMovieRepeatMode.One
        view.addSubview(moviePlayer.view)
        
        moviePlayer.play()
    }
    
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        moviePlayer.view.frame.size = size
    }

}

