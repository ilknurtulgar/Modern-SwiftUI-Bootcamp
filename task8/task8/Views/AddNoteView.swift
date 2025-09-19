//
//  AddNoteView.swift
//  task8
//
//  Created by İlknur Tulgar on 19.09.2025.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: NotesViewModel
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Title",text: $viewModel.title)
                
                ZStack(alignment: .topLeading){
                    
                    if viewModel.content.isEmpty{
                        Text("Content")
                            .foregroundColor(.gray.opacity(0.5))
                            .padding(.top,8)
                            .padding(.horizontal,4)
                    }
                    
                    TextEditor(text: $viewModel.content)
                        .padding(4)
                        .frame(minHeight: 600)
                }
                
            }
            .navigationTitle("New Note")
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Back"){
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
