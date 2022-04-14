//
//  ViewController.swift
//  weatherApp
//
//  Created by Hero Fiennes-Tiffin on 12.04.2022.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var weatherStatusLabel: UILabel!
    @IBOutlet var weatherStatusImage: UIImageView!
    @IBOutlet var degreesLabel: UILabel!
    @IBOutlet var tabView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLocationManager()
    }

    func startLocationManager() {
        
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = true
            locationManager.startUpdatingLocation()
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocate = locations.last {
            print(lastLocate.coordinate.latitude, lastLocate.coordinate.longitude)
        }
        
    }
}

