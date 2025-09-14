//
//  Event.swift
//  task6
//
//  Created by İlknur Tulgar on 14.09.2025.
//

import Foundation

struct Event: Identifiable {
    var id: UUID
    var title: String
    var date: Date
    var type: EventType
    var hasReminder: Bool
}

enum EventType: String, CaseIterable, Identifiable {
    case birthday = "Birthday 🎂"
    case work = "Work 💼"
    case hobby = "Hobby 🎨"
    case holiday = "Holiday 🎈"
    case sport = "Spor 🏃‍♂️"
    case meeting = "Meeting 🗣️"
    case other = "Other 💭"
    
    var id: String {self.rawValue}
}
