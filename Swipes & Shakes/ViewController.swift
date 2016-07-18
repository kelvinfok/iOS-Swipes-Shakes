//
//  ViewController.swift
//  Swipes & Shakes
//
//  Created by kelvinfok on 18/7/16.
//  Copyright © 2016 kelvinfok. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
    }
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            print("Device Shaken")
            let fileLocation = NSBundle.mainBundle().pathForResource("pew", ofType: "mp3")
            
            do { try
                
                player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                
                player.play()
                
            } catch {  }
            
        }
    }
    
    func swipe(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("Swiped Right")
            case UISwipeGestureRecognizerDirection.Up:
                print("Swiped Up")
            default:
                break
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

