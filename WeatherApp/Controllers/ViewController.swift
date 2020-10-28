//
//  ViewController.swift
//  WeatherApp
//
//  Created by Сергей Иванов on 27.10.2020.
//  Copyright © 2020 Сергей Иванов. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    var api = APIManager()
    var locationManager: CLLocationManager {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.requestWhenInUseAuthorization()
        return lm
    }

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var feelsLikeTemperature: UILabel!
    @IBOutlet weak var city: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
        api.onComplite = {
            weather in
            DispatchQueue.main.async {
                self.city.text = weather.city
                self.temperature.text = weather.temperatureString
                self.feelsLikeTemperature.text = weather.feelsLikeTemperatureString
                self.icon.image = weather.getIcon()
            }
        }
    }


    @IBAction func onSearch(_ sender: UIButton) {
        showRequestWeatherAlert() { [unowned self]
            city in
            self.api.request(with: requestType.city(city))
        }
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else { return }
        api.request(with: requestType.coordinate(latitude: coordinate.latitude, longitude: coordinate.longitude))
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // handle the error
    }
}

