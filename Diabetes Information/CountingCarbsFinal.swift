//
//  CountingCarbsFinal.swift
//  Diabetes Information
//
//  Created by Ennis Smith on 2/8/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import Foundation
import UIKit

// Test Commit
class CountingCarbsFinal: UIViewController{
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var quizResponse: UILabel!
    

    
   
    let dbqm = DiabetesInformationQuizModel(question: "Which one of these foods equals 15g of carbs?", correctAnswer:"2")
    @IBOutlet weak var finishButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        quizLabel.text = dbqm.printQuestion()
        quizResponse.text = ""
        finishButton.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func quizButton1(sender: UIButton) {
        if(dbqm.guessAnswer("1") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
        }
        
    }
    
  
    @IBAction func quizButton2(sender: UIButton) {
        if(dbqm.guessAnswer("2") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false        }
    }
    
    @IBAction func quizButton3(sender: UIButton) {
        if(dbqm.guessAnswer("3") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
        }
    }
    
    @IBAction func quizButton4(sender: UIButton) {
        if(dbqm.guessAnswer("4") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
        }
    }
}