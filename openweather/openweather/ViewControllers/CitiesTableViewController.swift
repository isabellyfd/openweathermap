//
//  CitiesTableViewController.swift
//  openweather
//
//  Created by Isabelly Damascena on 12/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

import UIKit
import InLocoMediaAPI

class CitiesTableViewController : UIViewController {
    
    var cities : [City]!
    var selectedCity : City!
    
    let SHOW_DETAILS_SEGUE = "showDetails"
    
    var newAd : LocalAd!
    
    @IBOutlet weak var tableView: UITableView!
    
    var indicator : LoadIndicador!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.indicator = LoadIndicador(forParentView: self.view)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SHOW_DETAILS_SEGUE{
            let destinationViewController = segue.destination as! CityDetailsViewController
            destinationViewController.city = self.selectedCity
            self.present(destinationViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func unwindToCitiesTableView(_ sender: UIStoryboardSegue){
        self.tableView.reloadData()
        self.indicator.startLoading()
        
        self.newAd = LocalAd(forInterstitialAdDelegate: self)
        self.newAd.load()
        
    }
}

extension CitiesTableViewController : ILMInterstitialAdDelegate {
    
    func ilmInterstitialAdDidReceive(_ interstitialAd: ILMInterstitialAd!) {
        self.indicator.stopLoading()
        DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + 0.5)) {
            interstitialAd.present(from: self.navigationController)
        }
        
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
        self.performSegue(withIdentifier: SHOW_DETAILS_SEGUE, sender: self)
    }
}

