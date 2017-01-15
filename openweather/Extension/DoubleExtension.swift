//
//  DoubleExtension.swift
//  openweather
//
//  Created by Isabelly Damascena on 13/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation

extension Double {
    func format(f: String) -> String {
        return String.init(format: "%\(f)f", self)
    }
}
