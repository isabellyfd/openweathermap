//
//  ViewController.swift
//  openweather
//
//  Created by Isabelly Damascena on 11/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let handlerResquest = WeatherRequestHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        handlerResquest.requestOpenWeatherWithCoordenates(latitude: 35, longitude: 139) { (json, error) in
           
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

