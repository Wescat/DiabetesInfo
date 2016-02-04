//
//  DiabetesInformationModel.swift
//  Diabetes Information
//
//  Created by Ennis Smith on 2/4/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import Foundation

class DiabetesInformationQuizModel{
    
    var question:String
    var correctAnswer:String
    
    init(question:String, correctAnswer:String){
        self.question = question
        self.correctAnswer = correctAnswer
    }
    
    func printQuestion(){
        print(self.question)
    }
    
    func guessAnswer(guess:String) -> Bool{
        return guess == self.correctAnswer
    }
    
}