//
//  LevenshteinTests.swift
//  TV FeudTests
//
//  Created by Quinton Pryce on 2019-12-31.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import XCTest
@testable import TV_Feud

class WordMatchTests: XCTestCase {

    func testWordMatch() {
        
        XCTAssertNotNil(WordMatch.isMatched(answer: "First Love", for: [createAnswer("first love")]))
        XCTAssertNil(WordMatch.isMatched(answer: "First Love", for: [createAnswer("love")]))
        XCTAssertNotNil(WordMatch.isMatched(answer: "Get a tattoo", for: [createAnswer("tattoo")]))
        XCTAssertNotNil(WordMatch.isMatched(answer: "White dress", for: [createAnswer("dress")]))

        XCTAssertNotNil(WordMatch.isMatched(answer: "1", for: [createAnswer("1")]))
        XCTAssertNil(WordMatch.isMatched(answer: "2", for: [createAnswer("20")]))
        XCTAssertNil(WordMatch.isMatched(answer: "2", for: [createAnswer("200")]))

    }

    private func createAnswer(_ string: String) -> Survey.Answer {
        Survey.Answer(string: string, percentage: nil)
    }

}
