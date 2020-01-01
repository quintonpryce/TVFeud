//
//  SurveyTableViewController.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-28.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import UIKit

class SurveyTableViewController: UITableViewController {

    // MARK: - Properties

    private var survey: Survey?

    // MARK: - Initialization

    func configure(survey: Survey) {
        self.survey = survey
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        survey != nil ? 1 : 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        survey?.answers.count ?? 0
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Answer Cell", for: indexPath)

        guard let answer = survey?.answers[indexPath.row] else { return UITableViewCell() }

        let number = "\(indexPath.row + 1): "
        var percentage = ""
        var answerString = ""

        if answer.answered {
            answerString = answer.string
            if let percent = answer.percentage { percentage = "Out of 100 people surveyed, \(percent) say " }
        }
        
        cell.textLabel?.text = number + percentage + answerString

        return cell
    }
}

// MARK: - Survey Delegate

extension SurveyTableViewController: SurveyDelegate {
    func didAnswerCorrect() {
        tableView.reloadData()
    }
}
