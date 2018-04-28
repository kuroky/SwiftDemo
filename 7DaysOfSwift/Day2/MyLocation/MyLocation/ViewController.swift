//
//  ViewController.swift
//  MyLocation
//
//  Created by kuroky on 2018/4/28.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var locationButton: UIButton!
    var locationManager: CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager = CLLocationManager.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
    }

    @IBAction func clickLocationButton(_ sender: UIButton) {
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder.init().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            if (error != nil) {
                self.descLabel.text = "location error"
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.updateLocation(pm)
            }
            else {
                self.descLabel.text = "location error"
            }
            
        }
    }
    
    func updateLocation(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.descLabel.text = postalCode! + " " + locality!
            
            self.descLabel.text?.append("\n" + administrativeArea! + ", " + country!)
        }
    }
}

