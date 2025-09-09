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
                
            }
        }
        
    }
}

#Preview {
    TaskManagementView()
}
