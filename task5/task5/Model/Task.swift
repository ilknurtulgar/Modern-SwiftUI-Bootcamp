//
//  Task.swift
//  task5
//
//  Created by İlknur Tulgar on 8.09.2025.
//

import Foundation

struct Task: Identifiable{
    var id: UUID? = UUID()
    var title: String
    var description: String
    var isCompleted: Bool = false
}
