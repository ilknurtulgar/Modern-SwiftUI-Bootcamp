//
//  WaterWidget.swift
//  task12
//
//  Created by İlknur Tulgar on 23.11.2025.
//

import WidgetKit
import SwiftUI


struct WaterWidget: Widget{
    let kind: String = "WaterWidget"
    
    var body: some WidgetConfiguration{
        StaticConfiguration(kind: kind, provider: WaterProvider()){entry in
        WaterWidgetViews(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
        .configurationDisplayName("Water Tracker")
        .description("Shows today's water intake")
    }
}
