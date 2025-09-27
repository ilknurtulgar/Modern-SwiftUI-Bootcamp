//
//  Persistence.swift
//  task10
//
//  Created by İlknur Tulgar on 24.09.2025.
//

import CoreData


struct PersistenceController {

    static let shared = PersistenceController()
    
    let container : NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Character")
        container.loadPersistentStores{storeDescription, error in
        if let error = error as NSError? {
                fatalError("unresolved error: \(error)")
            }
        }
    }
    
}

