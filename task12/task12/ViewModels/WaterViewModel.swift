//
//  WaterViewModel.swift
//  task12
//
//  Created by İlknur Tulgar on 31.10.2025.
//

import SwiftUI
import SwiftData
import WidgetKit

@MainActor
class WaterViewModel: ObservableObject {
    @Published var todayCount: Int = 0
    
    func loadTodayCount(context: ModelContext) {
        let today = Date()
        let descriptor = FetchDescriptor<WaterIntake>(
            sortBy: [SortDescriptor(\WaterIntake.date, order: .forward)]
        )
        let allIntakes = (try? context.fetch(descriptor)) ?? []
        todayCount = allIntakes.first(where: { Calendar.current.isDate($0.date, inSameDayAs: today) })?.count ?? 0
    }
    
    func addGlass(context: ModelContext) {
        let today = Date()
        let descriptor = FetchDescriptor<WaterIntake>(
            sortBy: [SortDescriptor(\WaterIntake.date, order: .forward)]
        )
   
        var todayIntake: WaterIntake
        if let intake = (try? context.fetch(descriptor))?.first(where: { Calendar.current.isDate($0.date, inSameDayAs: today) }) {
            if intake.count >= 8 {
                todayCount = 8
                return
            }
            intake.count += 1
            todayIntake = intake
        } else {
            todayIntake = WaterIntake(date: today, count: 1)
            context.insert(todayIntake)
        }
        
        try? context.save()
        
        todayCount = todayIntake.count

        WidgetCenter.shared.reloadAllTimelines()
    }
}



