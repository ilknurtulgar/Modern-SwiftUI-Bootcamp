//
//  TaskItem.swift
//  task4
//
//  Created by İlknur Tulgar on 6.09.2025.
//

import Foundation

struct TaskItem: Identifiable, Codable{
    var id: UUID? = UUID()
    var title: String
    var description: String
    var isCompleted: Bool
}

