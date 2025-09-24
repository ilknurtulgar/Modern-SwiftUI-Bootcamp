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
        NavigationView {
            List(weatViewModel.weather, id: \.id) { weather in
                HStack {
                    VStack(alignment: .leading) {
                        Text(weather.name)
                            .font(.headline)
                        Text("\(weather.main.temp, specifier: "%.1f")°C")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        if let firstWeather = weather.weather.first {
                            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(firstWeather.icon)@2x.png")) { image in
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        Text("Humidity: \(weather.main.humidity)%")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            .navigationTitle("Cities")
        }
        .onAppear {
            weatViewModel.fetchWeather(for: ["Istanbul", "Ankara", "Izmir", "Bursa"])
        }
    }
}

#Preview {
    WeatherView()
}
