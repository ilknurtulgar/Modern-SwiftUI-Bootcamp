//
//  FavoriteLocation.swift
//  task11
//
//  Created by İlknur Tulgar on 15.10.2025.
//

import Foundation
import SwiftData
import CoreLocation

@Model
class FavoriteLocation{
    var id: UUID
    var name: String
    var latitude: Double
    var longitude: Double
    var dateAdded: Date
    
    init(id: UUID = UUID(), name: String, latitude: Double, longitude: Double, dateAdded: Date = Date()) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.dateAdded = dateAdded
    }
    
    var coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
