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
    
    
    let dbqm2 = DiabetesInformationQuizModel(question: "Your blood sugar is between 80 and 100. What should you do now?", correctAnswer:"1")
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var questionBox: UITextView!
    @IBOutlet weak var snackPic: UIImageView!
    @IBOutlet weak var exercisePic: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        questionBox.text = dbqm2.printQuestion()
        quizResponse.text = ""
        finishButton.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func quizButton1(sender: UIButton) {
        if(dbqm2.guessAnswer("1") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
            exercisePic.hidden = true
            answer2.hidden = true
        }
        
    }
    
    
    @IBAction func quizButton2(sender: UIButton) {
        if(dbqm2.guessAnswer("2") == false)
        {
            quizResponse.text = "Try Again!"
        }
        else{
            quizResponse.text = "Correct!"
            finishButton.hidden = false
            snackPic.hidden = true
            answer1.hidden = true
        }
    }
    
    
}