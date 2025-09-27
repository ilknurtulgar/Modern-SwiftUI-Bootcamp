//
//  Character.swift
//  task10
//
//  Created by İlknur Tulgar on 27.09.2025.
//

import Foundation

struct CharachterResponse: Codable {
    let results: [Charachter]
}

struct Charachter: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
}

struct Origin: Codable {
    let name: String
}

struct Location: Codable {
    let name: String
}
