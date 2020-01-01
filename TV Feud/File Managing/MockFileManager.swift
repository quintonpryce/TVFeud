//
//  MockFileManager.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

class MockFileManager: FileManaging {
    static let question = "Tell Me The Age When Boys Stop Playing With Stuffed Animals (Numeric Only)."
    static let surveyOne = [MockFileManager.question, "7","22","8","19","10","15","5","11","6","10","4","9","3","8"]
    
    func readCSV(_ filename: String) -> [[String]] {
        [MockFileManager.surveyOne]
    }
}
