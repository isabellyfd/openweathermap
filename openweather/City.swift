//
//  File.swift
//  openweather
//
//  Created by Isabelly Damascena on 11/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation

class City {
    private var _name : String!
    private var _weather : Weather!
    
    var name : String {
        get {
            return self._name
        }
        
        set(newName){
            self._name = newName
        }
    }
    
    var weather : Weather {
        get {
            return self._weather
        }
        set(newWeather){
            self._weather = newWeather
        }
    }
}
