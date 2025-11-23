//
//  WaterWidgetProvider.swift
//  task12
//
//  Created by İlknur Tulgar on 23.11.2025.
//

import WidgetKit
import SwiftUI
import SwiftData

struct WaterProvider: TimelineProvider {
    
    
    func placeholder(in context: Context) -> WaterEntry {
        WaterEntry(date: Date(), count: 0)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WaterEntry) -> ()) {
        completion(WaterEntry(date: Date(), count: loadTodayCount()))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WaterEntry>) -> ()) {
        let entry = WaterEntry(date: Date(), count: loadTodayCount())
        let nextUpdate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
        
        completion(Timeline(entries: [entry], policy: .after(nextUpdate)))
    }
    
    private func loadTodayCount() -> Int {
        guard let container = try? ModelContainer(
            for: WaterIntake.self,
            configuration: .shared(
                named: "watertracker",
                in: .init(groupIdentifier: "group.com.ilknur.watertracker")
            )
        ) else { return 0 }

        let context = ModelContext(container)
        let descriptor = FetchDescriptor<WaterIntake>()
        let items = (try? context.fetch(descriptor)) ?? []

        let today = Date()
        return items.first(where: { Calendar.current.isDate($0.date, inSameDayAs: today) })?.count ?? 0
    }

}
