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
    
    func requestOpenWeatherWithCoordenates(latitude: Double, longitude: Double, callback: @escaping ((Any?, Error?) ->()) ) {
        
        let url = getFinalURLRequest(latitude: latitude, longitude: longitude);
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            
            switch response.result {
            case Result.success(let value):
                print(value)
                callback(value, nil);
                break
            case Result.failure(let error):
                callback(nil, error);
                break
            }
            
        })
    }
    
    fileprivate func getFinalURLRequest(latitude: Double, longitude: Double) -> String{
        
        let urlRequest = "http://api.openweathermap.org/data/2.5/find?lat=\(latitude)&lon=\(longitude)&cnt=15&APPID=\(API_KEY)"
        return urlRequest;
    }
    
    fileprivate func parserJSON(json: Any){
        
    }
    
}
