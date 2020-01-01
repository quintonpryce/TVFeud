//
//  SurveyViewController.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-28.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import UIKit
import Foundation

class SurveyViewController: UIViewController {

    // MARK: - Types

    enum State {
        case none
        case initial
        case firstPlay
        case play
        case steal
        case roundEnd
    }

    // MARK: - Properties

    #warning("We skip some surveys because we create a survey right away when this is initialized and when we set the round to initial. I need to change this.")
    var surveyManager: SurveyManaging = SurveyManager(fileManager: FileManager(), persistence: UserDefaults.standard)


    #warning("Might just want to make this optional.")
    var teamManager: TeamManaging = TeamManager(teamOneName: "Team 1", teamTwoName: "Team 2")

    var tableViewController: SurveyTableViewController?

    var speaker: Speaker?

    var gameState: State = .none {
        didSet { gameStateDidChange() }
    }

    var strikes: Int? {
        willSet {
            guard let strikes = newValue else { strikesLabel.text = ""; return }

            guard strikes < 3 else { gameState = .steal; return }

            strikesLabel.text = "\(strikes)/3 Strikes"
        }
    }

    @IBOutlet weak var surveyQuestionLabel: UILabel!
    @IBOutlet weak var answeredIcon: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var strikesLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        answerTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        speaker = Speaker(delegate: self)

        gameState = .initial
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tableViewController = segue.destination as? SurveyTableViewController {
            self.tableViewController = tableViewController
            surveyManager.delegate = tableViewController
            tableViewController.configure(survey: surveyManager.currentSurvey)
        }
    }

    // MARK: - Actions

    @IBAction func nextButtonPressed() {
        showScoreViewController()
    }

}

// MARK: - UITextField Delegate

extension SurveyViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard case .initial = gameState else { return true }

        speaker?.synth.pauseSpeaking(at: .immediate)

        showAlert(
            alertTitle: "Which team buzzed in first?",
            actionOneTitle: teamManager.team1.name, actionOneHandler: {
                self.gameState = .firstPlay
                self.teamManager.playingTeam = self.teamManager.team1

            }, actionTwoTitle: teamManager.team2.name, actionTwoHandler: {
                self.gameState = .firstPlay
                self.teamManager.playingTeam = self.teamManager.team2
            }
        )

        return false

    }

    @IBAction func didAnswer(_ sender: UITextField) {
        let teamAnswer = sender.text ?? ""
        sender.text = ""

        let answeredCorrectly = surveyManager.answer(teamAnswer)

        answeredIcon.text = answeredCorrectly ? "✅" : "❌"
        answeredIcon.show(for: 1.5)

        questionAnswered(correct: answeredCorrectly)
    }
}

// MARK: - Game state helpers

extension SurveyViewController {

    func gameStateDidChange() {
        switch gameState {
        case .none: break

        case .initial:
            answerTextField.isHidden = false
            nextButton.isHidden = true
            surveyManager.nextSurvey()
            surveyQuestionLabel.text = ""
            teamLabel.text = ""
            tableViewController?.configure(survey: surveyManager.currentSurvey)
            speaker?.speak(surveyManager.currentSurvey.question)

        case .firstPlay:
            answerTextField.becomeFirstResponder()

        case .play:
            strikes = 0
            teamLabel.text = teamManager.playingTeam.name

        case .steal:
            showAlert("Too bad \(teamManager.playingTeam.name), now the opposing team gets to steal!")
            strikesLabel.text = ""
            teamManager.togglePlayingTeam()
            teamLabel.text = teamManager.playingTeam.name

        case .roundEnd:
            endRound()
            answerTextField.isHidden = true
            nextButton.isHidden = false
            surveyManager.setAllAnswered()
            tableViewController?.configure(survey: surveyManager.currentSurvey)

        }
    }

    func questionAnswered(correct: Bool) {
        switch gameState {
        case .none, .initial: break

        case .firstPlay:
            if correct {
                gameState = .play
                showPickFirstPlayerAlert()
            } else {
                teamManager.togglePlayingTeam()
                teamLabel.text = teamManager.playingTeam.name
            }

        case .play:
            if !correct {
                strikes? += 1
            } else if surveyManager.areAllAnswersCorrect {
                gameState = .roundEnd
            }

        case .steal:
            if !correct { teamManager.togglePlayingTeam() }
            gameState = .roundEnd

        case .roundEnd:
            break

        }
    }

    private func endRound() {
        teamManager.playingTeam.score += surveyManager.totalScore
        if let winningTeam = teamManager.hasTeamWon {
            showAlert("Congrats on the win \(winningTeam.name)! You finshed with \(winningTeam.score) points!") { self.dismiss(animated: true, completion: nil) }
        } else {
            showAlert("\(teamManager.playingTeam.name) won that round!")
        }
    }

    private func showScoreViewController() {
        if let scoreViewController = storyboard?.instantiateViewController(identifier: "ScoreViewController") as? ScoreViewController {
            present(scoreViewController, animated: true, completion: nil)
            scoreViewController.configure(team1: teamManager.team1, team2: teamManager.team2)
        }
    }

    private func showPickFirstPlayerAlert() {
        showAlert(
            alertTitle: "Good Job \(teamManager.playingTeam.name)! What team would you like play, or pass?",
            actionOneTitle: "Play", actionOneHandler: { self.gameState = .play },
            actionTwoTitle: "Pass", actionTwoHandler: {
                self.teamManager.togglePlayingTeam()
                self.gameState = .play
            }
        )
    }
}
