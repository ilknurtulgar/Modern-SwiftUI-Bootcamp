//
//  EventViewList.swift
//  task6
//
//  Created by İlknur Tulgar on 14.09.2025.
//

import SwiftUI

struct EventViewList: View {
    @StateObject var viewModel = EventViewModel()
    @State private var showAddEvent = false
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.events){ event in
                    NavigationLink(destination: EventDetailView(viewModel: viewModel, event: event)){
                        VStack(alignment: .leading) {
                            Text(event.title)
                                .font(.headline)
                            Text(event.date, style: .date)
                                .font(.subheadline)
                            Text(event.type.rawValue)
                                .font(.caption)
                        }
                        .padding(.vertical,5)
                    }
                }
                .onDelete(perform: viewModel.deleteEvent)
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button { showAddEvent.toggle()
                    print("click: \(showAddEvent)")
                    }label: {
                        
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddEvent){
                AddEventView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    EventViewList()
}
