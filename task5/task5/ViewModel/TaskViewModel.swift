//
//  TaskViewModel.swift
//  task5
//
//  Created by İlknur Tulgar on 9.09.2025.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var newTaskTitle: String = ""
    @Published var newTaskDescription: String = ""
    
}
