//
//  Team.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

class Team: Equatable {
    
    let name: String
    var score: Int

    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }

    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.name == rhs.name
    }
}
