//
//  WeatherRequestHandler.swift
//  openweather
//
//  Created by Isabelly Damascena on 11/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class WeatherRequestHandler {
    private let API_KEY = "b4ff35ec7191db2c609baaef41b506b3"
    private let LIST = "list"
    private let MAIN = "main"
    private let MAX_TEMPERATURE = "temp_max"
    private let MIN_TEMPERATURE = "temp_min"
    private let WEATHER = "weather"
    private let DATA_INDEX = 0
    private let DESCRIPTION = "description"
    private let NAME = "name"
    
    
    private var _weatherRequestDelegate : WeatherRequestDelegate!
    
    var weatherRequestDelegate : WeatherRequestDelegate {
        get{
            return self._weatherRequestDelegate
        }
        set(delegate){
            self._weatherRequestDelegate = delegate
        }
    }
    
    func requestOpenWeatherWithCoordenates(coordinate: CLLocationCoordinate2D)  {
        
        let url = getFinalURLRequest(coordinate: coordinate);
        
        
        DispatchQueue.global().async {
            Alamofire.request(url).responseJSON(completionHandler: {
                response in
                
                switch response.result {
                    
                case Result.success(let value):
                    let cities : [City] = self.parserJSON(json: value)
                    self.weatherRequestDelegate.appDidReceiveData(cities: cities)
                    break
                case Result.failure(let error):
                    self.weatherRequestDelegate.appDidReceiveError(error: error)
                    break
                }
                
            })
        }
        
    }
    
    fileprivate func getFinalURLRequest(coordinate: CLLocationCoordinate2D) -> String{
        
        let urlRequest = "http://api.openweathermap.org/data/2.5/find?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&cnt=15&APPID=\(API_KEY)"
        return urlRequest;
    }
    
    fileprivate func parserJSON(json: Any) -> [City]{
        var cities : [City] = []
        
        let dictionary = json as! Dictionary<String, Any>
        
        let cityGroup = dictionary[LIST] as! [Dictionary<String, Any>]
        
        for city in cityGroup {
            let main = city[MAIN] as! Dictionary<String, Any>
            let maxTemperature = main[MAX_TEMPERATURE] as! Double
            let minTemperature = main[MIN_TEMPERATURE] as! Double
            
            let weatherDictionary = city[WEATHER] as! [Dictionary<String, Any>]
            let weatherDescription = weatherDictionary[DATA_INDEX][DESCRIPTION] as! String
            
            let name = city[NAME] as! String
            cities.append(setCity(WithName: name, maxTemperature: maxTemperature, minTemperature: minTemperature, weatherDescription: weatherDescription))
            
        }
        return cities
    }
    
    fileprivate func setCity(WithName name: String, maxTemperature max: Double, minTemperature min: Double, weatherDescription description: String) -> City{
        let weather = Weather()
        weather.maxTemperature = max
        weather.minTemperature = min
        weather.weatherDescription = description
        
        let city = City()
        city.name = name
        city.weather = weather
        
        return city
    }
    
    
    
}
