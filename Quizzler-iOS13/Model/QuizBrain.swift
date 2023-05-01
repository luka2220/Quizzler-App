//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Luka Piplica on 2023-04-29.
//  Copyright © 2023 Luka Piplica
//
//  The "Brain" of our quiz which handles all te logic

import Foundation

struct QuizBrain {
    // 2-D Array of quiz questions and answers
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "Eastern Standard Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionNumber = 0   // Used to set the current question number
    var userScore = 0        // Used to track the users current score
    
    // - Method for checking if answer is correct
    // - External parameter name is answer (Swift has internal and external parameter names)
    // or we can state there shouldnt be an external parameter name with _
    // - userAnswer -> A, B, C
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        
        // Dictionary for pairing answer letters with answers in quiz
        let answerPairs: [String: Int] = ["A": 0, "B": 1, "C": 2]
        // Correct Index
        let correctAnswer = quiz[questionNumber].correctAnswer
        // Get the index of the correct answer
        let correctIndex = quiz[questionNumber].answers.firstIndex(of: correctAnswer)!
        
        print("User Answer: \(userAnswer)")
        print("User Answer Index: \(answerPairs[userAnswer]!)")
        print("Correct Answer Index: \(correctIndex)")
        
        if answerPairs[userAnswer]! == correctIndex {
            userScore += 1
            return true
        }
        
        return false
    }
    
    // Method for updatin the answers
    func getCurrentAnswers() -> Array<String> {
        return quiz[questionNumber].answers // Returns an array of possible answers
    }
    
    // Method for retrieving the user score
    func getUserScore() -> Int {
        return userScore
    }
    
    // Method for retrieving the current question
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    // Method for retrieving the quiz progress
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    // - Method for updating the quiz logic
    // - The mutating function keyword allows us to change the state of
    // the struct change the properties for immutable tpo mutable
    mutating func nextQuestion() {
        // Check if the questionNumber index is in range of quiz length
        if questionNumber < quiz.count - 1 {
            questionNumber += 1     // Move to next question
        } else {
            questionNumber = 0      // Restart quiz question
            userScore = 0           // Reset the users score
        }
    }
}
