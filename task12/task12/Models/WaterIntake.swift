//
//  WaterIntake.swift
//  task12
//
//  Created by İlknur Tulgar on 31.10.2025.
//

import SwiftData
import Foundation

@Model
class WaterIntake {
    var date: Date
    var count: Int
    
    init(date: Date, count: Int = 0) {
        self.date = date
        self.count = count
    }
}
