//
//  ViewController.swift
//  WeatherApp
//
//  Created by Сергей Иванов on 27.10.2020.
//  Copyright © 2020 Сергей Иванов. All rights reserved.
//

import UIKit

extension ViewController {
    func showRequestWeatherAlert() {
        let alert = UIAlertController(title: "Get Weather", message: "", preferredStyle: .alert)
        let getAction = UIAlertAction(title: "Get", style: .default, handler: { [unowned alert] _ in
            guard let text = alert.textFields?.first?.text else { return }
            print(text)
        })
        let okCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(getAction)
        alert.addAction(okCancel)
        alert.addTextField(configurationHandler: {
            textField in
            textField.placeholder = "Enter city"
        })
        present(alert, animated: true)
    }
}
