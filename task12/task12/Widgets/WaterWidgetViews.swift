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
    let entry: WaterEntry
    
    var body: some View {
        VStack(spacing: 25){
            Text("🚰 Water Intake Tracking")
                .font(.headline)
            
            HStack(spacing: 5){
                ForEach(0..<8){ i in
                    Button(intent: AddWaterGlassIntent()){
                        Image(systemName: i < entry.count ? "drop.fill" : "drop")
                            .foregroundColor(.blue)
                    }
                    .disabled(entry.count >= 8)
                }
            }
            
            if entry.count >= 8 {
                Text("🎯 Target achieved!")
                    .font(.headline)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
