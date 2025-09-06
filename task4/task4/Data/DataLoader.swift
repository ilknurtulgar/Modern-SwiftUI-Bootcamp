//
//  DataLoader.swift
//  task4
//
//  Created by İlknur Tulgar on 6.09.2025.
//

import Foundation

func loadTasks() -> [TaskItem] {
    guard let url = Bundle.main.url(forResource: "data", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let tasks = try? JSONDecoder().decode([TaskItem].self, from: data) else {
        print("die")
        return []
    }
    print("live")
    return tasks
}

