//
//  ViewController.swift
//  Diabetes Information
//
//  Created by Wesley Cates on 1/31/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var mod1Button: UIButton!

    @IBOutlet var mod2Button: UIButton!
    
    @IBOutlet var mod3Button: UIButton!
    
    @IBOutlet var mod4Button: UIButton!
    
    @IBOutlet var mod5Button: UIButton!
    
    

    @IBAction func onExercisePress(sender: UIButton) {
    
        
        var storyboard = UIStoryboard(name: "Exercise", bundle: nil)
        var controller = storyboard.instantiateViewControllerWithIdentifier("ExerciseMenuController")
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    @IBAction func buttonClick(sender: UIButton) {
        
    }
}

