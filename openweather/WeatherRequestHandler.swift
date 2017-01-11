//
//  WeatherRequestHandler.swift
//  openweather
//
//  Created by Isabelly Damascena on 11/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation
import Alamofire

class WeatherRequestHandler {
    private let API_KEY = "b4ff35ec7191db2c609baaef41b506b3"
    
    private var _weatherRequestDelegate : WeatherRequestDelegate!
    
    var weatherRequestDelegate : WeatherRequestDelegate {
        get{
            return self._weatherRequestDelegate
        }
        set(delegate){
            self._weatherRequestDelegate = delegate
        }
    }
    
    func requestOpenWeatherWithCoordenates(latitude: Double, longitude: Double)  {
        
        let url = getFinalURLRequest(latitude: latitude, longitude: longitude);
        
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
    
    fileprivate func getFinalURLRequest(latitude: Double, longitude: Double) -> String{
        
        let urlRequest = "http://api.openweathermap.org/data/2.5/find?lat=\(latitude)&lon=\(longitude)&cnt=15&APPID=\(API_KEY)"
        return urlRequest;
    }
    
    fileprivate func parserJSON(json: Any) -> [City]{
        var cities : [City] = []
        
        let dictionary = json as! Dictionary<String, Any>
        
        let cityGroup = dictionary["list"] as! [Dictionary<String, Any>]
        
        for city in cityGroup {
            let main = city["main"] as! Dictionary<String, Any>
            let maxTemperature = main["temp_max"] as! Double
            let minTemperature = main["temp_min"] as! Double
            
            let weatherDictionary = city["weather"] as! [Dictionary<String, Any>]
            let weatherDescription = weatherDictionary[0]["description"] as! String
            
            let name = city["name"] as! String
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
