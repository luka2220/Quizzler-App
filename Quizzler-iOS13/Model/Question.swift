//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Luka Piplica on 2023-04-26.
//  Copyright © 2023 Luka Piplica. All rights reserved.
//

import Foundation

// Question structure
struct Question {
    
    let text: String
    let answers: Array<String>
    let correctAnswer: String
    
    init(q: String, a: Array<String>, correctAnswer: String) {
        self.text = q
        self.answers = a
        self.correctAnswer = correctAnswer
    }
}
