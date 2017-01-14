//
//  InlocoAdsHandler.swift
//  openweather
//
//  Created by Isabelly Damascena on 13/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation
import InLocoMediaAPI

class InlocoInitializer {
    private static  let AD_UNIT_ID = "f0d4120c0a7d0538e78b4c8e5d16975d183b418f899ca5794bda2f8259b15486"
    private static let INLOCO_APP_ID = "3632ed24e0158716fd115a710ff042e53131404a28e234ade506221f9be89279"
    
    public static func initAPI(){
        let options = ILMOptions()
        options.logEnabled = true
        options.developmentDevices = [AD_UNIT_ID]
        options.adsKey = INLOCO_APP_ID
        
        InLocoMedia.initWith(options)
    }
    
}
