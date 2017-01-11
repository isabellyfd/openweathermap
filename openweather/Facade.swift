//
//  Facade.swift
//  openweather
//
//  Created by Isabelly Damascena on 11/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation

class Facade {
    let requestHandler = WeatherRequestHandler()
    
    static let shared = Facade()
    
    public func requestAroundCitiesWithCoordinate(latitude: Double, longitude: Double){
        self.requestHandler.requestOpenWeatherWithCoordenates(latitude: latitude, longitude: longitude)
    }
    
    public func register(weatherRequestDelegate delegate: WeatherRequestDelegate){
        self.requestHandler.weatherRequestDelegate = delegate
    }
    
}
