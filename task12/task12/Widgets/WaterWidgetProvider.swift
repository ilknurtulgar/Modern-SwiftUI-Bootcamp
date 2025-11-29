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
        let url = FileManager.default.containerURL(
            forSecurityApplicationGroupIdentifier: "group.com.info.task12.watertracker"
        )!.appendingPathComponent("water.sqlite")

        let schema = Schema([WaterIntake.self])

        let configuration = ModelConfiguration(schema: schema, url: url)

        guard let container = try? ModelContainer(for: schema, configurations: [configuration]) else {
            return 0
        }

        let context = ModelContext(container)
        let descriptor = FetchDescriptor<WaterIntake>()
        let items = (try? context.fetch(descriptor)) ?? []

        let today = Date()
        return items.first { Calendar.current.isDate($0.date, inSameDayAs: today) }?.count ?? 0
    }

}
