//
//  MapViewController.swift
//  FavoriteHotels
//
//  Created by AYANO HARA on 2021/01/11.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
    }
}

//MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    
}
