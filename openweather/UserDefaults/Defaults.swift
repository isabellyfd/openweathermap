//
//  Defaults.swift
//  openweather
//
//  Created by Isabelly Damascena on 14/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation

class Defaults {
    private static let FIRST_ACCESS = "firsAcess"
    static var hasAlreadyAccess : String?
    
    public static func userHasAlreadyAccess() -> Bool{
        let defaults = UserDefaults.standard
        self.hasAlreadyAccess = defaults.object(forKey: FIRST_ACCESS) as? String
        
        if self.hasAlreadyAccess == nil {
            return false
        }else{
            return true
        }
        
    }
    
    public static func didAccess(){
        let defaults = UserDefaults.standard
        defaults.set("didAcess", forKey: FIRST_ACCESS)
        defaults.synchronize()
    }
}
