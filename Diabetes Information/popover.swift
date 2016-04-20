//
//  popover.swift
//  Diabetes Information
//
//  Created by Shelby Regelman on 4/20/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import UIKit

class popover: UIViewController, UIPopoverPresentationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func popover(sender: AnyObject) {
        self.performSegueWithIdentifier("showCorrect1", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showCorrect1" {
            var vc = segue.destinationViewController as! UIViewController
            var controller = vc.popoverPresentationController
            vc.preferredContentSize = CGSizeMake(50, 50)
        
            if controller != nil {
                controller?.delegate = self
            }
        }
    }
}