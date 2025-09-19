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
    @Published var title: String = ""
    @Published var content: String = ""

    private var viewContext: NSManagedObjectContext
    
    init(viewContext: NSManagedObjectContext = PersistenceController.shared.container.viewContext){
        self.viewContext = viewContext
        fetchNotes()
    }
    
    
    func fetchNotes(){
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Note.date, ascending: false)]
        
        do{
            notes = try viewContext.fetch(request)
        }catch{
            print("error: \(error.localizedDescription)")
        }
    }
    
    func addNote(){
        let newNote = Note(context: viewContext)
        newNote.id = UUID()
        newNote.title = title
        newNote.content = content
        newNote.date = Date()
        
        do{
            try viewContext.save()
            fetchNotes()
            title = ""
            content = ""
        }catch {
            print("error saving note: \(error.localizedDescription)")
        }
    }
    
    func deleteNote(at offsets: IndexSet){
        for index in offsets {
            let note = notes[index]
            viewContext.delete(note)
        }
        
        do{
            try viewContext.save()
            fetchNotes()
        }catch{
            print("error deleting: \(error.localizedDescription)")
        }
    }
}
