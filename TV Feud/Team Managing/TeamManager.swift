//
//  TeamManager.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

class TeamManager: TeamManaging {
    
    var team1: Team
    var team2: Team

    var playingTeam: Team

    var hasTeamWon: Team? {
        if team1.score > Constants.winningScore { return team1 }
        if team1.score > Constants.winningScore { return team1 }
        return nil
    }

    required init(teamOneName: String, teamTwoName: String) {
        team1 = Team(name: teamOneName, score: 0)
        team2 = Team(name: teamTwoName, score: 0)

        playingTeam = Bool.random() ? team1 : team2
    }

    func togglePlayingTeam() {
        playingTeam = playingTeam == team1 ? team2 : team1
    }
}
