//
//  SickDaysActivity.swift
//  Diabetes Information
//
//  Created by Ennis Smith on 4/22/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import Foundation
import UIKit

class SickDaysActivity: UIViewController {
    
    @IBOutlet weak var answerOne: UIButton!
    
    @IBOutlet weak var pillButton: UIButton!
    
    @IBOutlet weak var cakeButton: UIButton!
    
    @IBOutlet weak var finishButton: UIButton!
    
    @IBOutlet weak var meterLabel: UIButton!
    
    @IBOutlet weak var pillLabel: UIButton!
    
    @IBOutlet weak var cakeLabel: UIButton!
    
    @IBOutlet weak var quizResponse: UILabel!
    
    let dbqm = DiabetesInformationQuizModel(question: "If you're sick, you need to:", correctAnswer:"1")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        finishButton.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func meterButton(sender: UIButton) {
        if(dbqm.guessAnswer("1") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
            
        }

    }
    
    
    @IBAction func meterLabel(sender: UIButton) {
        if(dbqm.guessAnswer("1") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
            
        }

    }

    @IBAction func pillButton(sender: UIButton) {
        
        if(dbqm.guessAnswer("2") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
            
        }

    }
    
    @IBAction func pillLabel(sender: UIButton) {
        if(dbqm.guessAnswer("2") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
            
        }

    }
    
    @IBAction func cakeButton(sender: UIButton) {
        if(dbqm.guessAnswer("3") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
            
        }

    }
    
    
    @IBAction func cakeLabel(sender: UIButton) {
        if(dbqm.guessAnswer("3") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
            
        }

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
