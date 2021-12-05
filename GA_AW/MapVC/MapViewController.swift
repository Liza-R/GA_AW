//
//  MapViewController.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 05/12/2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    let map = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        map.centerToLocation(initialLocation)
        map.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude)
        map.addAnnotation(annotation)
        
    }
}

private extension MKMapView {
  func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000){
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

