//
//  CityDetailsViewController.swift
//  openweather
//
//  Created by Isabelly Damascena on 12/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import UIKit

extension Double {
    func format(f: String) -> String {
        return String.init(format: "%\(f)f", self)
    }
}

class CityDetailsViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    var city : City!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cityNameLabel.text = city.name
        maxTemperatureLabel.text = city.weather.maxTemperature.format(f: ".1")
        minTemperatureLabel.text = city.weather.minTemperature.format(f: ".1")
        weatherDescription.text = city.weather.weatherDescription
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToCitiesButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToCities", sender: self)
    }
    

}
