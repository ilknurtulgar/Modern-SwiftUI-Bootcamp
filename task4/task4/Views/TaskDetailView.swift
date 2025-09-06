//
//  TaskDetailView.swift
//  task4
//
//  Created by İlknur Tulgar on 6.09.2025.
//

import SwiftUI

struct TaskDetailView: View {
    var task: TaskItem
    
    var body: some View {
        VStack(alignment: .leading){
               Text(task.title)
                       .font(.largeTitle)
                       .bold()
            
                Text(task.description)
                        .font(.body)
        }
        .padding()
        .navigationTitle("Task Detail")
    }
}

#Preview {
    TaskDetailView(task: TaskItem(title: "Make the cook honey", description: "two eggs, 1 glass oil etc...", isCompleted: false))
}
