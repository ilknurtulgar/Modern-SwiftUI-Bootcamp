//
//  NotesViewModel.swift
//  task7
//
//  Created by İlknur Tulgar on 15.09.2025.
//

import Foundation

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = [
        Note(title: "Example note", content: "etc,etc,etc,etc,etc,etc,etc,etc,etc,etc", date: Date())
    ]
    
    private func saveNotes(){
        if let data = try? JSONEncoder().encode(notes){
            UserDefaults.standard.set(data,forKey: "notes_key")
        }
    }
    
    func deleteNote(at offsets: IndexSet){
        notes.remove(atOffsets: offsets)
        saveNotes()
    }
}
