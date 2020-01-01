//
//  TeamNameViewController.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import UIKit

class TeamNameViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var teamOneTextField: UITextField!
    @IBOutlet weak var teamTwoTextField: UITextField!

    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let surveyViewController = segue.destination as? SurveyViewController {

            let teamOneName = teamOneTextField.text?.isEmpty ?? true ? "Team 1" : teamOneTextField.text ?? "Team 1"
            let teamTwoName = teamTwoTextField.text?.isEmpty ?? true ? "Team 2" : teamTwoTextField.text ?? "Team 2"

            let teamManager = TeamManager(teamOneName: teamOneName, teamTwoName: teamTwoName)

            surveyViewController.teamManager = teamManager
        }
    }


}
