//
//  Exercise2.swift
//  Diabetes Information
//
//  Created by Wesley Cates on 4/16/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import Foundation
import UIKit


class ExerciseQuiz2: UIViewController{
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var quizResponse: UILabel!
    
    
    let dbqm = DiabetesInformationQuizModel(question: "Your blood sugar is between 80 and 100. What should you do now?", correctAnswer:"1")
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var questionBox: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        questionBox.text = dbqm.printQuestion()
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
            answer2.hidden = true
        }
        
    }
    
    
    @IBAction func quizButton2(sender: UIButton) {
        if(dbqm.guessAnswer("2") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
            answer1.hidden = true
        }
    }
    
    
}