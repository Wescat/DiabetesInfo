//
//  InsulinBasicsVideo.swift
//  Diabetes Information
//
//  Created by George Towles on 4/21/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//


import UIKit
import MediaPlayer

class drawInsulinVideo : UIViewController{
    
    var moviePlayer : MPMoviePlayerController!
    
    override func viewDidLoad() {
        let path = NSBundle.mainBundle().pathForResource("Drawing up insulin", ofType:"MOV")
        let url = NSURL.fileURLWithPath(path!)
        self.moviePlayer = MPMoviePlayerController(contentURL: url)
        if let player = self.moviePlayer {
            player.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            player.view.sizeToFit()
            player.fullscreen = false
            player.controlStyle = MPMovieControlStyle.None
            player.movieSourceType = MPMovieSourceType.File
            //player.repeatMode = MPMovieRepeatMode.One
            player.play()
            self.view.addSubview(player.view)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        moviePlayer.play()
    }
    
    override func viewWillDisappear(animated: Bool) {
        moviePlayer.pause()
    }

}