//
//  EventViewModel.swift
//  task6
//
//  Created by İlknur Tulgar on 14.09.2025.
//

import SwiftUI

class EventViewModel: ObservableObject {
    @Published var events: [Event] = [
        Event(id: UUID(), title: "Team Meeting", date: Date().addingTimeInterval(86400), type: .meeting, hasReminder: true)
    ]
    
    @Published var title: String = ""
    @Published var date: Date = Date()
    @Published var type: EventType = .other
    @Published var hasReminder: Bool = false
    
    func deleteEvent(at offsets: IndexSet){
        events.remove(atOffsets: offsets)
    }
    
    func addEvent(){
        let newEvent = Event(id: UUID(), title: title, date: date, type: type, hasReminder: hasReminder)
        events.append(newEvent)
        title = ""
        date = Date()
        type = .other
        hasReminder = false
    }
    
    func toggleReminder(for event: Event){
        if let index = events.firstIndex(where: { $0.id == event.id }){
            events[index].hasReminder.toggle()
        }
    }
    
    func deleteEvent(_ event: Event){
        if let index = events.firstIndex(where: {$0.id == event.id}){
            events.remove(at: index)
        }
           
    }

    
    
}

