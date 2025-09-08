//
//  DataLoader.swift
//  task4
//
//  Created by İlknur Tulgar on 6.09.2025.
//

import Foundation


func saveTasks(_ tasks: [TaskItem]){
    if let encoded = try? JSONEncoder().encode(tasks) {
        UserDefaults.standard.set(encoded, forKey: "tasks")
    }
}

func loadTasks() -> [TaskItem] {
    var tasks: [TaskItem] = []

    var bundleTasks: [TaskItem] = []
    if let url = Bundle.main.url(forResource: "data", withExtension: "json"),
       let data = try? Data(contentsOf: url),
       let decoded = try? JSONDecoder().decode([TaskItem].self, from: data) {
        bundleTasks = decoded
    }

    var userTasks: [TaskItem] = []
    if let data = UserDefaults.standard.data(forKey: "tasks"),
       let decoded = try? JSONDecoder().decode([TaskItem].self, from: data) {
        userTasks = decoded
    }

    let filteredBundleTasks = bundleTasks.filter { bundleTask in
        !userTasks.contains(where: { $0.id == bundleTask.id })
    }


    tasks.append(contentsOf: filteredBundleTasks)
    tasks.append(contentsOf: userTasks)

    return tasks
}



