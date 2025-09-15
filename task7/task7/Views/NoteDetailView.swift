//
//  NoteDetailView.swift
//  task7
//
//  Created by İlknur Tulgar on 15.09.2025.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note
    
    var body: some View {
       Form {
           Section(header: Text("Note Details")){
               Text("Title: \(note.title)")
               Text("Content: \(note.content)")
               Text("Date: \(note.date.formatted(date: .abbreviated, time: .omitted))")
             
           }
        }
       .navigationTitle("Details")
    }
}

#Preview {
    NoteDetailView(note: Note(title: "Simple Example", content: "etc,etc,etc,etc,etc,etc", date: Date()))
}
