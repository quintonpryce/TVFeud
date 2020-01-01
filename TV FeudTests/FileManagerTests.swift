//
//  FileManagerTests.swift
//  TV FeudTests
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import XCTest
@testable import TV_Feud

class FileManagerTests: XCTestCase {

    var fileManager: FileManaging!

    func testReadCSV() {
        fileManager = FileManager()

        let result = fileManager.readCSV("SurveyQuestions7")

        XCTAssertEqual(result[0][0], "Tell Me The Age When Boys Stop Playing With Stuffed Animals (Numeric Only).")
    }

}
