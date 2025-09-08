//
//  TaskController.swift
//  task4
//
//  Created by İlknur Tulgar on 8.09.2025.
//
import Foundation

class TaskController : ObservableObject {
    @Published var tasks: [TaskItem] = []
    
    @Published  var newTaskTitle: String = ""
    @Published var newTaskDescription: String = ""
    
    
    init() {
        self.tasks = loadTasks()
    }
    
    func addNewTask(){
        guard !newTaskTitle.isEmpty else { return }
        
        let newTask = TaskItem(id: UUID(), title: newTaskTitle, description: newTaskDescription, isCompleted: false)
       
            tasks.append(newTask)
            newTaskTitle = ""
            newTaskDescription = ""
            saveTasks(tasks)
    }
    
    func deleteTasks(at offsets: IndexSet, from allTasks: inout [TaskItem],filter: [TaskItem]){
        for index in offsets {
            if let realIndex = allTasks.firstIndex(where: {$0.id == filter[index].id}){
                allTasks.remove(at: realIndex)
            }
        }
        saveTasks(allTasks)
    }
    
    var toBeCompleted : [TaskItem] {
        tasks.filter { !$0.isCompleted }
    }
    
    
    var completedItems: [TaskItem] {
        tasks.filter { $0.isCompleted }
    }
}
