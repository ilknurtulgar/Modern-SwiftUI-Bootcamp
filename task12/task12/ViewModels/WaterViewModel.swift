//
//  WaterViewModel.swift
//  task12
//
//  Created by İlknur Tulgar on 31.10.2025.
//

import SwiftUI
import WidgetKit
import SwiftData

@MainActor
class WaterViewModel: ObservableObject{
    
 
    
    @Query(sort: \WaterIntake.date, order: .reverse)
    var waterIntakes: [WaterIntake]
    
  
    
    func addGlass(context: ModelContext){
        let today = Date()
        
        if let intake = waterIntakes.first(where: {Calendar.current.isDate($0.date, inSameDayAs: today)}){
            intake.count += 1
        }else {
            let newIntake = WaterIntake(date: today, count: 1)
            context.insert(newIntake)
        }
        
        try? context.save()
        WidgetCenter.shared.reloadAllTimelines()//widget update
    }
    
    var todayCount: Int {
        let today = Date()
        return waterIntakes.first(where: { Calendar.current.isDate($0.date, inSameDayAs: today) })?.count ?? 0
    }
}

