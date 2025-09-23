//
//  WeatherView.swift
//  task9
//
//  Created by İlknur Tulgar on 22.09.2025.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var weatViewModel = WeatherViewModel()
    var body: some View {
        VStack{
            if let weather = weatViewModel.weather{
                Text(weather.name)
                    .font(.title)
                    .padding()
                Text("\(weather.main.temp, specifier: "%.1f")°C")
                    .font(.largeTitle)
            }else if let errorMesage = weatViewModel.errorMessage{
                Text("Error: \(errorMesage)")
                    .foregroundColor(.red)
            }
            else{
                ProgressView()
                Text("Loading...")
            }
        }
        .onAppear{
            weatViewModel.fetchWeather(for: "Istanbul")
        }
    }
}

#Preview {
    WeatherView()
}
