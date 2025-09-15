//
//  AddNoteView.swift
//  task7
//
//  Created by İlknur Tulgar on 15.09.2025.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: NotesViewModel
    
    var body: some View {
        NavigationView {
            Form{
                TextField("Title",text: $viewModel.title)
                
                TextField("Content",text: $viewModel.content)
            }
            .navigationTitle("New Note")
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        viewModel.title = ""
                        viewModel.content = ""
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        viewModel.addNote()
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddNoteView(viewModel: NotesViewModel())
}
