//
//  Facade.swift
//  openweather
//
//  Created by Isabelly Damascena on 11/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation
import CoreLocation
class Facade {
    let requestHandler = WeatherRequestHandler()
    
    static let shared = Facade()
    
    public func requestAroundCitiesWithCoordinate(coordinate: CLLocationCoordinate2D){
        self.requestHandler.requestOpenWeatherWithCoordenates(coordinate: coordinate)
    }
    
    public func register(weatherRequestDelegate delegate: WeatherRequestDelegate){
        self.requestHandler.weatherRequestDelegate = delegate
    }
    
}
