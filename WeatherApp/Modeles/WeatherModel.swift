//
//  Weather.swift
//  WeatherApp
//
//  Created by Сергей Иванов on 28.10.2020.
//  Copyright © 2020 Сергей Иванов. All rights reserved.
//

import Foundation

struct WeatherModel: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

struct Weather: Codable {
    let id: Int
}
