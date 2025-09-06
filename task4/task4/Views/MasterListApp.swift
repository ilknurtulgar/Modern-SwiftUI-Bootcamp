//
//  MasterListApp.swift
//  task4
//
//  Created by İlknur Tulgar on 6.09.2025.
//

import SwiftUI

struct MasterListApp: View {
    @State private var tasks: [TaskItem] = loadTasks()


    
    var body: some View {
        let toBeCompleted = tasks.filter { !$0.isCompleted }
        let completedItems = tasks.filter { $0.isCompleted }
        
        NavigationView {
            List {
                
                Section(header: Text("To Be Completed")){
                    ForEach(toBeCompleted){ task in
                        NavigationLink(destination: TaskDetailView(task: task)){
                            Text(task.title)
                        }
                    }
                }
                
                Section(header: Text("Completed Items")){
                    ForEach(completedItems){ task in
                        NavigationLink(destination: TaskDetailView(task: task)){
                            Text(task.title)
                        }
                    }
                }
            }
            .navigationTitle("Master List")
        }
    }
}

#Preview {
    MasterListApp()
}
