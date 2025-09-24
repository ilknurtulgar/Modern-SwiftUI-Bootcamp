//
//  WeatherViewModel.swift
//  task9
//
//  Created by İlknur Tulgar on 22.09.2025.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: [WeatherResponse] = []
    
    private let apiKey = "f7091c7b4ebad85106a3d96dcd28ec8e"
   
    func fetchWeather(for cities: [String]){
        weather.removeAll()
        
        for city in cities{
            let cityQuery = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
            let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityQuery)&appid=\(apiKey)&units=metric"
            
            guard let url = URL(string: urlString) else { continue }
            
            URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                if let error = error {
                    print("error: \(error.localizedDescription)")
                    return
                }
                guard let data = data else { return }
                
                do{
                    let decoded = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    DispatchQueue.main.async {
                        self?.weather.append(decoded)
                    }
                }catch{
                    print("decode error : \(error)")
                }
            }.resume()
        }
    }
}
