//
//  MockSurveyManager.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

class MockSurveyManager: SurveyManaging {
    var delegate: SurveyDelegate?

    var currentSurvey: Survey

    var areAllAnswersCorrect: Bool = false

    var totalScore: Int = 0

    init() {
        let question = "Tell Me The Age When Boys Stop Playing With Stuffed Animals (Numeric Only)."
        let answers = [
            Survey.Answer(string: "7", percentage: "22"),
            Survey.Answer(string: "8", percentage: "19"),
            Survey.Answer(string: "10", percentage: "15"),
            Survey.Answer(string: "5", percentage: "11")
        ]

        currentSurvey = Survey(question: question, answers: answers)
    }

    func nextSurvey() { }

    func answer(_ answer: String) -> Bool { return true }

    func setAllAnswered() { }
}
