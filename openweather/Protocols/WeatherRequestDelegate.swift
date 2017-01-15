//
//  File.swift
//  openweather
//
//  Created by Isabelly Damascena on 11/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation

protocol WeatherRequestDelegate {
    func appDidReceiveData(cities: [City])
    func appDidReceiveError(error: Error)
}
