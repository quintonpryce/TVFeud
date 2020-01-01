//
//  SurveyViewController+Speech.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-30.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import AVFoundation
import UIKit

extension SurveyViewController: AVSpeechSynthesizerDelegate {

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        showQuestionLabel()
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        showQuestionLabel()
    }

    private func showQuestionLabel() {
        UIView.transition(
            with: surveyQuestionLabel,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: {
                self.surveyQuestionLabel.text = self.surveyManager.currentSurvey.question
            },
            completion: nil
        )
    }
}
