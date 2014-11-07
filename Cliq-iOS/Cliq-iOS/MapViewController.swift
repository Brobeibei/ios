//
//  MapViewController.swift
//  Cliq-iOS
//
//  Created by Aayush Sharma on 11/7/14.
//  Copyright (c) 2014 Cliq. All rights reserved.
//

import Foundation
import MapKit
import UIKit
import CoreLocation

class MapViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let location = CLLocationCoordinate2D(
            latitude: 51.50007773,
            longitude: -0.1246402
        )
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        let mapView = MKMapView()
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "Sample Annotation"
        annotation.subtitle = "Location"
        mapView.addAnnotation(annotation)
    }
}