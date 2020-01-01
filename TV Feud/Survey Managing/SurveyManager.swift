//
//  SurveyManager.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

class SurveyManager: SurveyManaging {
    
    var currentSurvey: Survey

    static let rowKey = "kRow"
    static let columnKey = "kColumn"

    private let fileManager: FileManaging
    private let persistence: UserDefaults

    var delegate: SurveyDelegate?

    var areAllAnswersCorrect: Bool {
        currentSurvey.answers.reduce(true) { $0 && $1.answered }
    }

    var totalScore: Int {
        currentSurvey.answers.reduce(0) { (score, answer) -> Int in
            guard let percentage = answer.percentage else { return score }

            return score + (answer.answered ? percentage : 0)
        }
    }

    init(fileManager: FileManaging, persistence: UserDefaults) {
        self.fileManager = fileManager
        self.persistence = persistence
        self.currentSurvey = Self.createSurvey(fileManager: fileManager, persistence: persistence)
    }

    func nextSurvey() {
        currentSurvey = Self.createSurvey(fileManager: fileManager, persistence: persistence)
    }

    func answer(_ teamAnswer: String) -> Bool {
        let unansweredAnswers = currentSurvey.answers.filter { !$0.answered }

        guard let answer = WordMatch.isMatched(answer: teamAnswer, for: unansweredAnswers) else {
            return false
        }

        answer.answered = true
        delegate?.didAnswerCorrect()

        return true
    }

    func setAllAnswered() {
        currentSurvey.answers.forEach { $0.answered = true }
    }

    static func createSurvey(fileManager: FileManaging, persistence: UserDefaults) -> Survey {
        let data = fileManager.readCSV("SurveyQuestions7")

        if data.count > persistence.currentSurvey { persistence.currentSurvey = 0 }
        
        var surveyStringArray = data[persistence.currentSurvey].split(separator: ",")[0]

        let question = surveyStringArray.removeFirst().description

        var answers: [Survey.Answer] = []

        for _ in 0..<surveyStringArray.count / 2 {
            if surveyStringArray.count <= 1 { break }

            let answerString = surveyStringArray.removeFirst().description
            let percentage = surveyStringArray.removeFirst().description
            let survey = Survey.Answer(string: answerString, percentage: percentage)

            answers.append(survey)
        }

        return Survey(question: question, answers: answers)
    }
}
