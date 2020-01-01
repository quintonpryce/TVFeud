//
//  FileManager.swift
//  TV Feud
//
//  Created by Quinton Pryce on 2019-12-29.
//  Copyright © 2019 Quinton Pryce. All rights reserved.
//

import Foundation

class FileManager: FileManaging {

    func readCSV(_ filename: String) -> [[String]] {
        guard let data = read(filename, ofType: ".csv") else { return [[]] }

        return csvArrayRepresentation(for: data)
    }

    private func read(_ filename: String, ofType fileType: String) -> String? {
        guard let filepath = Bundle.main.path(forResource: filename, ofType: fileType) else { return nil }

        return try? String(contentsOfFile: filepath, encoding: .utf8)
    }

    private func csvArrayRepresentation(for data: String) -> [[String]] {
        let rows = data.components(separatedBy: "\n")

        return rows.map { row -> [String] in
            let columns = row.components(separatedBy: ",")
            return columns
        }
    }
}
