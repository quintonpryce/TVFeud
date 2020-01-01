//
//  TeamManaging.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

protocol TeamManaging {
    var team1: Team { get }
    var team2: Team { get }

    var playingTeam: Team { get set }

    var hasTeamWon: Team? { get }

    init(teamOneName: String, teamTwoName: String)

    func togglePlayingTeam()
}
