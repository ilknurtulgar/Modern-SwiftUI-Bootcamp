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
    
    func toggleGlass(at index: Int, context: ModelContext) {
            let today = Date()
            let descriptor = FetchDescriptor<WaterIntake>(
                sortBy: [SortDescriptor(\WaterIntake.date, order: .forward)]
            )
            let allIntakes = (try? context.fetch(descriptor)) ?? []
            
            var todayIntake: WaterIntake
            if let intake = allIntakes.first(where: { Calendar.current.isDate($0.date, inSameDayAs: today) }) {
                todayIntake = intake
            } else {
                todayIntake = WaterIntake(date: today, count: 0)
                context.insert(todayIntake)
            }
            
            // Toggle mantığı
            if index < todayIntake.count {
                todayIntake.count -= 1 // doluysa azalt
            } else if todayIntake.count < 8 {
                todayIntake.count += 1 // boşsa artır
            }
            
            try? context.save()
            todayCount = todayIntake.count
            
            WidgetCenter.shared.reloadAllTimelines()
        }
}



