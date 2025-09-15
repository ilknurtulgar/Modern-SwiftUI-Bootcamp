//
//  NotesListView.swift
//  task7
//
//  Created by İlknur Tulgar on 15.09.2025.
//

import SwiftUI

struct NotesListView: View {
    @StateObject private var viewModel = NotesViewModel()
    @State private var showAddNote = false
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.notes){note in
                    NavigationLink(destination: NoteDetailView(note: note)){
                        VStack(alignment: .leading){
                            Text(note.title)
                                .font(.headline)
                            Text(note.date.formatted(date: .abbreviated, time: .shortened))
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteNote)
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
    NotesListView()
}
