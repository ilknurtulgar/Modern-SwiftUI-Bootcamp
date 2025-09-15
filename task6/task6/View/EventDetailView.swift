//
//  EventDetailView.swift
//  task6
//
//  Created by İlknur Tulgar on 14.09.2025.
//

import SwiftUI

struct EventDetailView: View {
    @ObservedObject var viewModel: EventViewModel
    @Environment(\.dismiss) var dismiss
    var event: Event
    
    var body: some View {
        Form{
            Section(header: Text("Event Information")){
                Text("Title: \(event.title)")
                Text("Date: \(event.date.formatted(date: .abbreviated, time:.omitted))")
                Text("Type: \(event.type.rawValue)")
            }
            Section{
                Toggle("Reminder",isOn: Binding(get:{ event.hasReminder} , set: {_ in
                    viewModel.toggleReminder(for: event)
                }
                ))
            }
            Section{
                Button(role: .destructive){
                    viewModel.deleteEvent(event)
                    dismiss()
                } label: {
                    Text("Event Delete")
                }
            }
        }
        .navigationTitle("Event Details")
    }
}

#Preview {
    EventDetailView(viewModel: EventViewModel(), event: Event(id: UUID(), title: "Read a book", date: Date(), type: .hobby, hasReminder: true))
}
