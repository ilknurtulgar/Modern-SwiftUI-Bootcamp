//
//  TaskManagementView.swift
//  task5
//
//  Created by İlknur Tulgar on 8.09.2025.
//

import SwiftUI

struct TaskManagementView: View {
    @StateObject private var taskViewModel = TaskViewModel()
    var body: some View {
        VStack(spacing: 16){
            
            HStack{
                VStack{
                    TextField("Title", text: $taskViewModel.newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Description", text: $taskViewModel.newTaskDescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button(action: {
                    taskViewModel.addTask()
                }){
                    Text("Add")
                        .padding()
                        .background(Color.pink)
                        .foregroundStyle(.white)
                        .cornerRadius(15)
                }
            }
            .padding()
            
            List{
                ForEach(taskViewModel.tasks) {task in
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .font(.headline)
                                .strikethrough(task.isCompleted)
                            
                            if !task.description.isEmpty {
                                Text(task.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                            }
                        }
                        Spacer()
                        Button(action: {
                            taskViewModel.toggleCompletion(for: task)
                        }){
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .pink : .gray)
                        }
                    }
                }
                .onDelete(perform: taskViewModel.deleteTask)
            }
        }
    }
}

#Preview {
    TaskManagementView()
}
