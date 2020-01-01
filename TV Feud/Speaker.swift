//
//  Speaker.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import AVFoundation

class Speaker {
    
    let synth = AVSpeechSynthesizer()

    init(delegate: AVSpeechSynthesizerDelegate?) {
        synth.delegate = delegate
    }

    func speak(_ string: String) {
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(identifier: "Samantha (Enhanced)")
        utterance.rate = 0.4

        synth.speak(utterance)
    }
}


