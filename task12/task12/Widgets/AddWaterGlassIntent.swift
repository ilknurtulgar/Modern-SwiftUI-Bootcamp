
import AppIntents
import SwiftData
import WidgetKit

struct AddWaterGlassIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Add Water Glass"
    static var description = IntentDescription("Adds a glass of water to today's intake.")
    
    @MainActor
    func perform() async throws -> some IntentResult {
        let today = Date()
        
        let url = FileManager.default.containerURL(
            forSecurityApplicationGroupIdentifier: "group.com.info.task12.watertracker"
        )!.appendingPathComponent("water.sqlite")
        
        let schema = Schema([WaterIntake.self])
        let configuration = ModelConfiguration(schema: schema, url: url)
        guard let container = try? ModelContainer(for: schema, configurations: [configuration]) else {
            return .result()
        }
        
        let context = ModelContext(container)
        let descriptor = FetchDescriptor<WaterIntake>()
        let allIntakes = (try? context.fetch(descriptor)) ?? []
        
        if let intake = allIntakes.first(where: { Calendar.current.isDate($0.date, inSameDayAs: today) }) {
            // Sınır 8
            if intake.count < 8 {
                intake.count += 1
            }
        } else {
            // Yeni intake başlat
            let newIntake = WaterIntake(date: today, count: 1)
            context.insert(newIntake)
        }
        
        try? context.save()
        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}

