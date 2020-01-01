//
//  SurveyManagerTests.swift
//  TV FeudTests
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import XCTest
@testable import TV_Feud

class MockUserDefauls: UserDefaults {
    override var currentSurvey: Int {
        get {
            return 0
        } set { }
    }
}

class SurveyManagerTests: XCTestCase {
    
    let persistance: UserDefaults = MockUserDefauls()

    func testCreateSurvey() {
        // Given
        let fileManager = MockFileManager()
        let surveyOne = MockFileManager.surveyOne

        // When
        let survey = SurveyManager.createSurvey(fileManager: fileManager, persistence: persistance)

        // Then
        XCTAssertEqual(survey.question, surveyOne[0])
        XCTAssertEqual(survey.answers.count, 7)

        for i in 0..<surveyOne.count / 2 {
            // 1 + (questions), every 2 entries after contains the answer then the percentage.
            XCTAssertEqual(survey.answers[i].string, surveyOne[1 + i * 2])
            XCTAssertEqual(survey.answers[i].percentage, Int(surveyOne[1 + i * 2 + 1]))
        }
    }
}
