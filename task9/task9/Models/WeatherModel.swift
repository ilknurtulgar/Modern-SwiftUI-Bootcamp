//
//  WeatherModel.swift
//  task9
//
//  Created by İlknur Tulgar on 22.09.2025.
//

import Foundation

/*https://api.openweathermap.org/data/2.5/weather?q={CITY},{STATE_CODE},{COUNTRY_CODE}&appid={API_KEY}&units=metric&lang=tr
 */

struct WeatherResponse: Codable{
    let cityName: String
    let weather: [Weather]
    let mainInfo: Main
}

struct Weather: Codable{
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}
