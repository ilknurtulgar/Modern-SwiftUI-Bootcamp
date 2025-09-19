//
//  NoteDetailView.swift
//  task8
//
//  Created by İlknur Tulgar on 19.09.2025.
//

import SwiftUI
import CoreData

struct NoteDetailView: View {
    @ObservedObject var note: Note
    @ObservedObject var viewModel: NotesViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String
    @State private var content: String
    
    init(note: Note, viewModel: NotesViewModel) {
        self.note = note
        self.viewModel = viewModel
        _title = State(initialValue: note.title ?? "")
        _content = State(initialValue: note.content ?? "")
    }
    
    var body: some View {
        VStack(spacing: 12){
            
            TextField("Title", text: $title)
                .font(.headline)
                .bold()
            
            TextEditor(text: $content)
                .font(.subheadline)
                .frame(minHeight: 200)
            HStack {
                Spacer()
                Button("Save"){
                    viewModel.changeNote(note,newTitle: title,newContent: content)
                    dismiss()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(18)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle("Note Detail")
    }
}


struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let container = NSPersistentContainer(name: "NotesModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load store: \(error)")
            }
        }
        let context = container.viewContext
        
        
        let mockNote = Note(context: context)
        mockNote.title = "Sample Title"
        mockNote.content = "This is some sample content for preview."
        mockNote.date = Date()
        
        return NoteDetailView(note: mockNote,viewModel: NotesViewModel())
            .environment(\.managedObjectContext, context)
    }
}
