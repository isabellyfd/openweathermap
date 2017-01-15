//
//  LoadIndicator.swift
//  openweather
//
//  Created by Isabelly Damascena on 13/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import Foundation
import UIKit

class LoadIndicador {
    var indicador : UIActivityIndicatorView
    
    init(forParentView view: UIView) {
        self.indicador = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        self.indicador.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.indicador.center = view.center
        view.addSubview(self.indicador)
        self.indicador.bringSubview(toFront: view)
    }
    
    func startLoading(){
        self.indicador.startAnimating()
        self.setNetWorkActivityIndicator(forBool: true)
    }
    
    func stopLoading(){
        self.indicador.stopAnimating()
        self.setNetWorkActivityIndicator(forBool: false)
    }
    
    fileprivate func setNetWorkActivityIndicator(forBool bool: Bool){
        UIApplication.shared.isNetworkActivityIndicatorVisible = bool
    }
}
