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

    override func viewDidLoad() {
        super.viewDidLoad()

        showMovie()
    }

    
    func showMovie() {
        
        var moviePlayer = MPMoviePlayerController(contentURL: NSURL(string: "http://itstreaming.apple.com/podcasts/apple_keynotes/1_macworld2007.m4v"))
        moviePlayer.movieSourceType = MPMovieSourceType.Streaming
        moviePlayer.controlStyle = MPMovieControlStyle.Fullscreen
        moviePlayer.view.frame = view.bounds
        view.addSubview(moviePlayer.view)
        
        moviePlayer.play()
    }


}

