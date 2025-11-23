//
//  WaterWidgetViews.swift
//  task12
//
//  Created by İlknur Tulgar on 23.11.2025.
//

import SwiftUI
import WidgetKit
import AppIntents

struct WaterWidgetViews: View {
    let entry: WaterProvider.Entry
    
    var body: some View {
        VStack{
            Text("💧 Water Today")
                .font(.headline)
            Text("\(entry.count) / 8")
                .font(.title)
            
            HStack{
                ForEach(0..<8){i in
                    Button(intent: AddWaterGlassIntent()){
                        Image(systemName: i < entry.count ? "drop.fill" : "drop")
                                                  .foregroundColor(.pink)
                    }
                }
            }
        }
        .padding()
    }
}
//
//#Preview {
//    WaterWidgetViews()
//}
