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
            self._maxTemperature = self.transformKelvinToCelcius(kelvinTemperature: newMaxTemperature)
        }
    }
    
    var minTemperature : Double {
        get {
            return self._minTemperature
        }
        set (newMinTemperature){
            self._minTemperature = self.transformKelvinToCelcius(kelvinTemperature: newMinTemperature)

        }
        
    }
    
    
    fileprivate func transformKelvinToCelcius(kelvinTemperature: Double) -> Double{
        let celciusTemperature: Double = (kelvinTemperature - 273.0)
        return celciusTemperature;
    }
}
