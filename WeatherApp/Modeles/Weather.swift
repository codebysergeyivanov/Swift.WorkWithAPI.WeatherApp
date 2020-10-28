//
//  Weather.swift
//  WeatherApp
//
//  Created by Сергей Иванов on 28.10.2020.
//  Copyright © 2020 Сергей Иванов. All rights reserved.
//

import UIKit

struct WeatherObject {
    let icon: Int
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return String(format: "%.0f", feelsLikeTemperature)
    }
    let city: String
    
    func getIcon() -> UIImage {
        switch icon {
        case 300...321:
            return UIImage(systemName: "cloud.drizzle.fill")!
        case 500...531:
            return UIImage(systemName: "cloud.drizzle.fill")!
        case 600...622:
            return UIImage(systemName: "cloud.snow.fill")!
        case 701...781:
            return UIImage(systemName: "cloud.fog.fill")!
        case 800:
            return UIImage(systemName: "sun.max.fill")!
        case 801...804:
            return UIImage(systemName: "cloud.fill")!
        default:
            return UIImage(systemName: "nosign")!
        }
    }
    
    init?(data: WeatherModel) {
        self.icon = data.weather.first!.id
        self.temperature = data.main.temp
        self.feelsLikeTemperature = data.main.feelsLike
        self.city = data.name
    }
}
