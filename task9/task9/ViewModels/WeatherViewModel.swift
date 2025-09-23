//
//  WeatherViewModel.swift
//  task9
//
//  Created by İlknur Tulgar on 22.09.2025.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherResponse?
    @Published var errorMessage: String?
    
    func fetchWeather(for city: String) {
        let apiKey = "f7091c7b4ebad85106a3d96dcd28ec8e"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString)else{
            errorMessage = "Invalid URL"
            return
        }
      
        URLSession.shared.dataTask(with: url){ [self]data,response,error in
            if let data = data{
                do{
                    let decoded = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.weather = decoded
                    }
                }catch{
                    errorMessage = "Decoding error"
                    return
                }
            }
        }
        .resume()
    }
}
