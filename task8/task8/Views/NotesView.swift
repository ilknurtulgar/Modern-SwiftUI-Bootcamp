//
//  NotesView.swift
//  task8
//
//  Created by İlknur Tulgar on 19.09.2025.
//

import SwiftUI
import CoreData

struct NotesView: View {
    @StateObject private var viewModel =  NotesViewModel()
    @State private var showAddNote = false
    
    var body: some View {
        NavigationView{
            Group{
                if viewModel.notes.isEmpty{
                    Text("Right now you have no notes")
                }
                else
                {
                    List {
                        ForEach(viewModel.notes) { note in
                            NavigationLink(destination: NoteDetailView()) {
                                VStack(alignment: .leading) {
                                    Text(note.title ?? "No Title")
                                    if let date = note.date {
                                        Text(date.formatted(date: .abbreviated, time: .shortened))
                                    }
                                }
                            }
                        }
                        .onDelete(perform: viewModel.deleteNote)
                    }
                }
            }
            .navigationTitle("My Notes")
            .toolbar{
                Button{
                    showAddNote = true
                }label:{
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddNote){
                AddNoteView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    NotesView()
}
