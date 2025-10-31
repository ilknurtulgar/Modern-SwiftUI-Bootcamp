//
//  FavoritesView.swift
//  task11
//
//  Created by İlknur Tulgar on 15.10.2025.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        List(homeViewModel.favoriteLocation,id:\.id){fav in
            VStack(alignment: .leading){
                Text(fav.name)
                    .font(.headline)
                Text("Lat: \(fav.latitude), Lon: \(fav.longitude)")
                    .font(.subheadline)
                Text("Eklenme Tarihi: \(fav.dateAdded.formatted())")
                    .font(.caption)
            }
            .padding(4)
        }
        .navigationTitle("Favorites Locations")
    }
}

//#Preview {
//    FavoritesView()
//}
