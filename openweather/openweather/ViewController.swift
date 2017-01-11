//
//  ViewController.swift
//  openweather
//
//  Created by Isabelly Damascena on 11/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        Facade.shared.register(weatherRequestDelegate: self)
        
        Facade.shared.requestAroundCitiesWithCoordinate(latitude: 35, longitude: 139)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : WeatherRequestDelegate {
    
    func appDidReceiveData(cities: [City]) {
        for city in cities {
            print(city.name)
        }
    }
    
    func appDidReceiveError(error: Error) {
        print(error)
    }
}

