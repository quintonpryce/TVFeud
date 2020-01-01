//
//  FileManaging.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

protocol FileManaging {
    
    /// Returns an array representation of the csv with the given `filename`. The file must be added to the main project bundle.
    func readCSV(_ filename: String) -> [[String]]
}
