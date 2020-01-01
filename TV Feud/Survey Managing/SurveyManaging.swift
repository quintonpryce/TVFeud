//
//  SurveyManaging.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

protocol SurveyManaging {
    var currentSurvey: Survey { get }
    var areAllAnswersCorrect: Bool { get }
    var totalScore: Int { get }
    var delegate: SurveyDelegate? { get set }

    func nextSurvey()
    func setAllAnswered()
    func answer(_ answer: String) -> Bool

}
