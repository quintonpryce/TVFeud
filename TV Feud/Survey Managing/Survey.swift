//
//  Survey.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

/// Survey holds reference to the `answered` value.
class Survey {

    class Answer {
        
        let string: String
        let percentage: Int?
        #warning("I don't like that I had to make botth these classes to change this one variable. Could be moved elsewhere.")
        var answered: Bool

        init(string: String, percentage: String?, answered: Bool = false) {
            self.string = string
            self.percentage = Int(percentage ?? "")
            self.answered = answered
        }
    }

    let question: String
    var answers: [Answer]

    init(question: String, answers: [Answer]) {
        self.question = question
        self.answers = answers
    }
}
