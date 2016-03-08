//
//  ViewController2.swift
//  Diabetes Information
//
//  Created by Wesley Cates on 1/31/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var textField: UITextView!

    @IBOutlet var SwipeField: UISwipeGestureRecognizer!
    
    @IBAction func textMove(sender: AnyObject) {
    }
    
    //Attach Main Menu buttons to this class
    @IBAction func onMainMenuPress(sender: UIButton) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("MainMenu")
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
