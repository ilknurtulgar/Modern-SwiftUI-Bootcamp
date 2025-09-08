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
        VStack(alignment: .center){
            
            HStack{
                
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                    .foregroundColor(task.isCompleted ? .accentColor : .gray)
                
                   Text(task.title)
                           .font(.largeTitle)
                           .fontWeight(.regular)
                           .lineLimit(1)
                           .truncationMode(.tail)
                            }
            
                Text(task.description)
                        .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle("Task Detail")
    }
}

#Preview {
    TaskDetailView(task: TaskItem(title: "Make the cook honey", description: "two eggs, 1 glass oil etc...", isCompleted: true))
}
