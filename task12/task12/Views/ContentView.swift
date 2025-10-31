//
//  ContentView.swift
//  task12
//
//  Created by İlknur Tulgar on 31.10.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = WaterViewModel()
       
    var body: some View {
        VStack(spacing: 20){
            Text("the cup drunk today: \(viewModel.todayCount)")
                .font(.title)
            
            HStack(spacing: 10){
                ForEach(0..<8){index in
                    Image(systemName: index < viewModel.todayCount ? "drop.fill" : "drop")
                        .foregroundColor(.blue)
                        .font(.title2)
                }
            }
            
            Button(action: {
                viewModel.addGlass(context: context)
            }){
                Text("+1 Glass")
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    ContentView()
    
}
