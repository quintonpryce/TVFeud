//
//  UserDefaultsExtensions.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

extension UserDefaults {

    // ObjC allows us to override this variable when running tests that use an injected UserDefaults object. 
    @objc var currentSurvey: Int {
        get {
            let currentSurvey = UserDefaults.standard.integer(forKey: "kRow")
            UserDefaults.standard.set(currentSurvey + 1, forKey: "kRow")

            return currentSurvey
        } set {
            UserDefaults.standard.set(newValue, forKey: "kRow")
        }
    }
}
