//
//  ScoreViewController.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-30.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation
import UIKit

class ScoreViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var teamOneNameLabel: UILabel!
    @IBOutlet weak var teamOneScoreLabel: UILabel!
    @IBOutlet weak var teamTwoNameLabel: UILabel!
    @IBOutlet weak var teamTwoScoreLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Initialization

    func configure(team1: Team, team2: Team) {
        teamOneNameLabel.text = team1.name
        teamOneScoreLabel.text = String(team1.score)

        teamTwoNameLabel.text = team2.name
        teamTwoScoreLabel.text = String(team2.score)
    }

    // MARK: - Actions

    @IBAction func nextButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}
