//
//  MasterListApp.swift
//  task4
//
//  Created by İlknur Tulgar on 6.09.2025.
//

import SwiftUI

struct MasterListApp: View {
    @StateObject private var controller = TaskController()
    @State private var themeColor: Color = .white
    
    var body: some View {
        NavigationView {
            ZStack {
                themeColor.edgesIgnoringSafeArea(.all)
                VStack(){
                    HStack {
                        VStack(){
                            
                            TextField("Title", text: $controller.newTaskTitle)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            TextField("Description", text: $controller.newTaskDescription)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        Button("Add"){
                            controller.addNewTask()
                        }.padding()
                        
                    }.padding()
                    
                    List {
                        
                        Section(header: Text("To Be Completed")){
                            ForEach(controller.toBeCompleted){ task in
                                NavigationLink(destination: TaskDetailView(task: task)){
                                    Text(task.title)
                                }
                            }
                            .onDelete{ index in
                                controller.deleteTasks(at:index,from: &controller.tasks,filter: controller.toBeCompleted)
                            }
                        }
                        
                        Section(header: Text("Completed Items")){
                            ForEach(controller.completedItems){ task in
                                NavigationLink(destination: TaskDetailView(task: task)){
                                    Text(task.title)
                                }
                            }
                            .onDelete { index in
                                controller.deleteTasks(at: index, from: &controller.tasks, filter: controller.completedItems)
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                }
                .navigationTitle("Master List")
                .onAppear{
                    themeColor = Color(
                        red: .random(in: 0...1),
                        green: .random(in: 0...1),
                        blue: .random(in: 0...1)
                        
                    )
                }
            }
        }
    }
}

#Preview {
    MasterListApp()
}
