//
//  NotesViewModel.swift
//  task8
//
//  Created by İlknur Tulgar on 19.09.2025.
//

import Foundation
import CoreData

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []

    private var viewContext: NSManagedObjectContext
    
    init(viewContext: NSManagedObjectContext = PersistenceController.shared.container.viewContext){
        self.viewContext = viewContext
        fetchNotes()
    }
    
    
    func fetchNotes(){
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Note.date, ascending: true)]
        
        do{
            notes = try viewContext.fetch(request)
        }catch{
            print("error: \(error.localizedDescription)")
        }
    }
}
