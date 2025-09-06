//
//  DataLoader.swift
//  task4
//
//  Created by İlknur Tulgar on 6.09.2025.
//

import Foundation

func loadTasks() -> [TaskItem] {
    guard let url = Bundle.main.url(forResource: "data", withExtension: "json"),
          let data = try? Data(contentsOf: url) else { return [] }

    do {
        var tasks = try JSONDecoder().decode([TaskItem].self, from: data)
        for i in 0..<tasks.count {
            tasks[i].id = UUID()
        }
        print("live")
        return tasks
    } catch {
        print("die", error)
        return []
    }
}


