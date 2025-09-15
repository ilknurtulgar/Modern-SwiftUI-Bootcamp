//
//  NotesViewModel.swift
//  task7
//
//  Created by İlknur Tulgar on 15.09.2025.
//

import Foundation

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []
    @Published var title = ""
    @Published var content = ""
    
    init() {
       loadNotes()
    }
    
    private func loadNotes(){
        if let data = UserDefaults.standard.data(forKey: "notes_key"),
           let decoded = try? JSONDecoder().decode([Note].self, from: data){
            notes = decoded
        }
    }
    
    private func saveNotes(){
        if let data = try? JSONEncoder().encode(notes){
            UserDefaults.standard.set(data,forKey: "notes_key")
        }
    }
    
    func deleteNote(at offsets: IndexSet){
        notes.remove(atOffsets: offsets)
        saveNotes()
    }
    
    func addNote(){
        let newNote = Note(id: UUID(),title: title, content:content , date: Date())
        notes.append(newNote)
        saveNotes()
        title = ""
        content = ""
        
    }
}
