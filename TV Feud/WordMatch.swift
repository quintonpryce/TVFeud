//
//  WordMatch.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-31.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

class WordMatch {

    static func isMatched(answer: String, for possibleAnswers: [Survey.Answer]) -> Survey.Answer? {
        var lowestAnswerDifference = answer.count > 2 ? Int(ceil(Double(answer.count) / 2)) : answer.count / 2
        var correctAnswer: Survey.Answer?

        possibleAnswers.forEach { possibleAnswer in
            let levenshtein = answer.lowercased().levenshtein(possibleAnswer.string.lowercased())
            if levenshtein <= lowestAnswerDifference {
                lowestAnswerDifference = levenshtein
                correctAnswer = possibleAnswer
            }
        }

        return correctAnswer
    }


}


