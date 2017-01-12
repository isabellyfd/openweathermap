//
//  ViewController.swift
//  openweather
//
//  Created by Isabelly Damascena on 11/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager : CLLocationManager!
    var pin : MKPointAnnotation!
    var pressedCoordinate : CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        Facade.shared.register(weatherRequestDelegate: self)
        
        map.delegate = self
        //map.showsUserLocation = true
        
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        pin = MKPointAnnotation()
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func searchButtonClicked(_ sender: Any) {
        if (self.pressedCoordinate != nil){
            Facade.shared.requestAroundCitiesWithCoordinate(coordinate: self.pressedCoordinate)
        }
    }

    @IBAction func logPressGesture(_ sender: Any) {
        let gesture = sender as! UIGestureRecognizer
        
        if gesture.state != UIGestureRecognizerState.began {
            return
        }
        let touchLocation = gesture.location(in: self.map)
        self.pressedCoordinate = self.map.convert(touchLocation, toCoordinateFrom: self.map)
        
        print(pressedCoordinate)

        self.addAnnotationToView()
        
    }
  
    
    func addAnnotationToView() {
        if self.pin != nil {
            self.map.removeAnnotation(self.pin)
        }
        
        self.pin = MKPointAnnotation()
        self.pin.coordinate  = self.pressedCoordinate
        self.map.addAnnotation(self.pin)
    }
}




extension MapViewController : WeatherRequestDelegate {
    
    func appDidReceiveData(cities: [City]) {
        
        for city in cities {
            print(city.name)
        }
    }
    
    func appDidReceiveError(error: Error) {
        print(error)
    }
}
