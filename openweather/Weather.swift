//
//  Weather.swift
//  openweather
//
//  Created by Isabelly Damascena on 11/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation


class Weather {
    private var _minTemperature : Double!
    private var _maxTemperature : Double!
    private var _weatherDescription : String!
    
    var weatherDescription : String {
        get {
            return self._weatherDescription
        }
        set(newDescription){
           self._weatherDescription = newDescription
        }
    }
    
    var maxTemperature : Double {
        get {
            return self._maxTemperature
        }
        set (newMaxTemperature){
            self._maxTemperature = self.transformFahrenheitToCelcius(fahrenheitTemperature: newMaxTemperature)
        }
    }
    
    var minTemperature : Double {
        get {
            return self._minTemperature
        }
        set (newMinTemperature){
            self._minTemperature = self.transformFahrenheitToCelcius(fahrenheitTemperature: newMinTemperature)
        }
        
    }
    
    
    fileprivate func transformFahrenheitToCelcius(fahrenheitTemperature: Double) -> Double{
        let celciusTemperature: Double = ((fahrenheitTemperature - 32)/1.8)
        return celciusTemperature;
    }
}
