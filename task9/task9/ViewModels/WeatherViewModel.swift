//
//  WeatherViewModel.swift
//  task9
//
//  Created by İlknur Tulgar on 22.09.2025.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    
    func fetchWeather(for city: String) {
        let apiKey = "f7091c7b4ebad85106a3d96dcd28ec8e"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
    }
}
