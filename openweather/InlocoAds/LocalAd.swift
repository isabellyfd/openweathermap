
//
//  LocalAds.swift
//  openweather
//
//  Created by Isabelly Damascena on 14/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation
import InLocoMediaAPI

class LocalAd {
    var newAd : ILMInterstitialAd!
    
    init(forInterstitialAdDelegate delegate : ILMInterstitialAdDelegate) {
        self.newAd = ILMInterstitialAd()
        self.newAd.delegate = delegate
    }
    
    public func load(){
        self.newAd.load()
    }

}
