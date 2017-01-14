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
    
    var indicator : LoadIndicador!
    var cities : [City]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        Facade.shared.register(weatherRequestDelegate: self)
        
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        pin = MKPointAnnotation()
        
        indicator = LoadIndicador(forParentView: self.map)
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func searchButtonClicked(_ sender: Any) {
        if (self.pressedCoordinate != nil){
            Facade.shared.requestAroundCitiesWithCoordinate(coordinate: self.pressedCoordinate)
            self.indicator.startLoading()
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
    
    
    @IBAction func unwindToMap(_ sender: UIStoryboardSegue){
        
    }
}

extension MapViewController : WeatherRequestDelegate{
    func appDidReceiveData(cities: [City]) {
        DispatchQueue.global().sync {
            self.indicator.stopLoading()
            self.cities = cities
            self.performSegue(withIdentifier: "showCityTableView", sender: self)
        }
        
    }
    
    func appDidReceiveError(error: Error) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showCityTableView" {
            let destinationViewController = segue.destination as! CitiesTableViewController
            destinationViewController.cities = self.cities
            self.present(destinationViewController, animated: true, completion: nil)
        }
    }
}




