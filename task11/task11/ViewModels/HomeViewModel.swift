//
//  HomeViewModel.swift
//  task11
//
//  Created by İlknur Tulgar on 31.10.2025.
//

import Foundation
import SwiftUI
import MapKit

class HomeViewModel: ObservableObject {
    @Published var favoriteLocation: [FavoriteLocation] = []
    
    func addFavorite(name: String,latitude: Double, longitude: Double){
        let newFavorite = FavoriteLocation(name: name, latitude: latitude
                                           , longitude: longitude)
        favoriteLocation.append(newFavorite)
    }
}
