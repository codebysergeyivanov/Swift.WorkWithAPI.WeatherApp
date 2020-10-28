//
//  APIManager.swift
//  WeatherApp
//
//  Created by Сергей Иванов on 27.10.2020.
//  Copyright © 2020 Сергей Иванов. All rights reserved.
//

import Foundation
import CoreLocation

enum requestType {
    case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    case city(_ city:String)
}

class APIManager {
    func request(with type: requestType) {
        let selectedURLString: String?
        switch type {
        case .coordinate(let latitude, let longitude):
            selectedURLString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)"
        case .city(let city):
            selectedURLString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        }
        guard let urlString = selectedURLString else { return }
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let text = String(data: data, encoding: .utf8)
                print(text)
            }
        }
        task.resume()
    }
}
