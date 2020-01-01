//
//  StringExtensions.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-31.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

extension String {
    #warning("Not sure if I am going to end up using this now that I have the Levenshtein algo but we can keep it around for now")
    var wordCount: Int {
        let trimmed = trimmingCharacters(in: .whitespaces)
        return trimmed.filter { $0 == " " }.count
    }
}
