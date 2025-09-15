//
//  Note.swift
//  task7
//
//  Created by İlknur Tulgar on 15.09.2025.
//

import Foundation

struct Note: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
    var date: Date
}
