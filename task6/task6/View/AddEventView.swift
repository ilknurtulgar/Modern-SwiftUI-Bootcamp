//
//  AddEventView.swift
//  task6
//
//  Created by İlknur Tulgar on 14.09.2025.
//

import SwiftUI

struct AddEventView: View {
    @ObservedObject var viewModel: EventViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("About The Event")){
                    TextField("Event Name",text: $viewModel.title)
                    DatePicker("Date",selection: $viewModel.date,displayedComponents: .date)
                    
                    Picker("Type",selection: $viewModel.type){
                        ForEach(EventType.allCases){eventType in
                            Text(eventType.rawValue).tag(eventType)
                        }
                    }
                }
                Section {
                    Toggle("Reminder",isOn: $viewModel.hasReminder)
                }
            }
            .navigationTitle("New Event")
            .toolbar {
                ToolbarItem(placement: .cancellationAction){Button("Back"){dismiss()}}
                
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        viewModel.addEvent()
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddEventView(viewModel: EventViewModel())
}
