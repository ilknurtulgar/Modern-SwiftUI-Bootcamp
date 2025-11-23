//
//  AddWaterGlassIntent.swift
//  task12
//
//  Created by İlknur Tulgar on 24.11.2025.
//

import AppIntents
import SwiftData
import WidgetKit

@MainActor
func perform() async throws -> some IntentResult {
    let today = Date()
    guard let container = try? ModelContainer(
        for: WaterIntake.self,
        configuration: .shared(
            named: "watertracker",
            in: .init(groupIdentifier: "group.com.ilknur.watertracker")
        )
    ) else { return .result() }

    let context = ModelContext(container)
    let descriptor = FetchDescriptor<WaterIntake>()
    let allIntakes = (try? context.fetch(descriptor)) ?? []

    if let intake = allIntakes.first(where: { Calendar.current.isDate($0.date, inSameDayAs: today) }) {
        intake.count += 1
    } else {
        let newIntake = WaterIntake(date: today, count: 1)
        context.insert(newIntake)
    }

    try? context.save()
    WidgetCenter.shared.reloadAllTimelines()

    return .result()
}

