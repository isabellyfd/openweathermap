//
//  CitiesTableViewController.swift
//  openweather
//
//  Created by Isabelly Damascena on 12/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import UIKit

class CitiesTableViewController : UIViewController {
    
    var cities : [City]!
    var selectedCity : City!
    var indicator : UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        Facade.shared.register(weatherRequestDelegate: self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.setIndicatorToView()
        self.indicator.startAnimating()
    }
    
    func setIndicatorToView() {
        indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        self.indicator.bringSubview(toFront: self.view)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "showDetails"{
            let destinationView = segue.destination as! CityDetailsViewController
            destinationView.city = self.selectedCity
            self.present(destinationView, animated: true, completion: nil)
        }
    }
    
    @IBAction func unwindToCitiesTableView(_ sender: UIStoryboardSegue){
        
    }
}

extension CitiesTableViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.cities == nil {
            return 0
        }else{
            return self.cities!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : CustomCell? = nil
        
        if self.cities != nil {
            cell  = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell?
            cell?.cityName.text = cities[indexPath.row].name
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCity = cities[indexPath.row]
        self.performSegue(withIdentifier: "showDetails", sender: self)
    }
}

extension CitiesTableViewController : WeatherRequestDelegate {
    
    func appDidReceiveData(cities: [City]) {
        DispatchQueue.global().sync {
            self.indicator.stopAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.cities = cities
            self.tableView.reloadData()
        }
    }
    
    func appDidReceiveError(error: Error) {
        print(error)
    }
}
