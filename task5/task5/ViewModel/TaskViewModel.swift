//
//  TaskViewModel.swift
//  task5
//
//  Created by İlknur Tulgar on 9.09.2025.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var newTaskTitle: String = ""
    @Published var newTaskDescription: String = ""
    
    func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        let task = Task(title: newTaskTitle, description: newTaskDescription)
        tasks.append(task)
        newTaskTitle = ""
        newTaskDescription = ""
    }
    
    func deleteTask(at offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
    }
    
    func toggleCompletion(for task: Task){
        if let index = tasks.firstIndex(where: {$0.id == task.id}){
            tasks[index].isCompleted.toggle()
        }
    }
}
