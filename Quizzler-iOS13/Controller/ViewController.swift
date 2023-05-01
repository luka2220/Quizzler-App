//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Luka Piplica on 04/26/2023.
//  Copyright © 2023 Luka Piplica All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UI Components
    @IBOutlet weak var questionLabel: UILabel!          // Question text
    @IBOutlet weak var progressBar: UIProgressView!     // Question progress bar
    @IBOutlet weak var scoreLabel: UILabel!             // User Score Label
    @IBOutlet weak var questionALabel: UILabel!         // Answer A label
    @IBOutlet weak var questionBLabel: UILabel!         // Answer B label
    @IBOutlet weak var questionCLabel: UILabel!         // Answer C label
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var CButton: UIButton!
    
    
    // Instance of QuizBrain Model with Quiz logic
    var quizBrain = QuizBrain()
    
    
    // Function that only runs when application is first loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // User answer -> A/B/C
        let userAnswer = sender.currentTitle!
        // Checking the users answer
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // Update quiz to next question
        quizBrain.nextQuestion()
        
        // Delay updateUI fucntion by 0.2 seconds
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // - Obj-C attribute function to interact with Obj-C runtime for Timer.scheduledTimer()
    // - Function for incramenting the question number
    @objc func updateUI() {
        // Display question in quiz based on questionNumber index
        questionLabel.text = quizBrain.getQuestionText()
        
        // Progress bar calculation & update
        progressBar.progress = quizBrain.getProgress()
        
        // Reset the buttons colours
        AButton.backgroundColor = UIColor.clear
        BButton.backgroundColor = UIColor.clear
        CButton.backgroundColor = UIColor.clear
        
        // Update the quiz answer label's
        let currentAnswers: Array<String> = quizBrain.getCurrentAnswers()
        questionALabel.text = "A) \(currentAnswers[0])"
        questionBLabel.text = "B) \(currentAnswers[1])"
        questionCLabel.text = "C) \(currentAnswers[2])"
        
        // Update the score
        scoreLabel.text = "Score: \(quizBrain.getUserScore())"
    }
    
}

