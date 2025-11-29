//
//  ContentView.swift
//  task12
//
//  Created by İlknur Tulgar on 31.10.2025.
//

import SwiftUI
import SwiftData
import WidgetKit

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = WaterViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            Text("The cup drunk today: \(viewModel.todayCount)")
                .font(.title)
            
            HStack(spacing: 10){
                ForEach(0..<8) { index in
                    Button {
                        viewModel.toggleGlass(at: index, context: context)
                    } label: {
                        Image(systemName: index < viewModel.todayCount ? "drop.fill" : "drop")
                            .foregroundColor(.blue)
                            .font(.title2)
                    }
                }
            }

            
            if viewModel.todayCount < 8 {
                Button("+1 Glass") {
                    viewModel.toggleGlass(at: viewModel.todayCount, context: context)
                }
                .buttonStyle(.borderedProminent)
            } else {
                Text("🎯 The target has been reached!")
                    .font(.headline)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .onAppear{
            viewModel.loadTodayCount(context: context)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            
            viewModel.loadTodayCount(context: context)
        }
    }
}


#Preview {
    ContentView()
    
}
