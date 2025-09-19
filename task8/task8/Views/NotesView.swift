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
    
    var body: some View {
        NavigationView{
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(destination: NoteDetailView()) {
                        VStack(alignment: .leading) {
                            Text(note.title ?? "No Title")
                            if let date = note.date {
                                Text(date.formatted(date: .abbreviated, time: .omitted))
                            }
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    NotesView()
//}
