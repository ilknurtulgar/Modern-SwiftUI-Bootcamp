//
//  PersistenceController.swift
//  task8
//
//  Created by İlknur Tulgar on 19.09.2025.
//

import CoreData

//persistenceController, restoran müdürü
//NSPersistentContiner, restoranın kendisi
//NSManagedObjectContext, garson
//Entity, yemek türü
struct PersistenceController {
    static let shared = PersistenceController()
    
    let container : NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "NotesModel")
        container.loadPersistentStores{storeDescription, error in
            if let error = error as NSError? {
                fatalError("unresolved error: \(error)")
            }
        }
    }
    
}
