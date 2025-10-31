//
//  HomeView.swift
//  task11
//
//  Created by İlknur Tulgar on 15.10.2025.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @StateObject var locationManager = LocationManager()
    @StateObject var viewModel = HomeViewModel()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.0, longitude: 29.0), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        NavigationStack{
            VStack{
                if let loc = locationManager.loc{
                    let annotations = viewModel.favoriteLocation + [
                        FavoriteLocation(name: "Sen", latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                    ]
                    
                    Map(coordinateRegion: $region, annotationItems: annotations) { place in
                        MapMarker(coordinate: place.coordinate, tint: place.name == "Sen" ? .blue : .red)
                    }
                    
                    .frame(height: 400)
                    .onAppear { region.center = loc.coordinate }
                    
                    Text("Coordinate: \(loc.coordinate.latitude), \(loc.coordinate.longitude)")
                    Text("Address: \(locationManager.address)")
                    
                    Button("Favorites") {
                        viewModel.addFavorite(name: "Favori \(viewModel.favoriteLocation.count + 1)", latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                    }
                    .padding()
                    
                   
                    NavigationLink("Favorites",destination: FavoritesView(homeViewModel: viewModel))
                }else{
                    Text("Location cant take in cause not approve")
                        .padding()
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
