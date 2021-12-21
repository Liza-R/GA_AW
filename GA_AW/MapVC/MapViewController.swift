//
//  MapViewController.swift
//  GA_AW
//
//  Created by Elizaveta Rogozhina on 05/12/2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    private let map = MKMapView(),
                exitButton = UIButton()
    
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
        map.addSubview(exitButton)
        
        exitButton.frame = CGRect(x: 20, y: 60, width: 100, height: 30)
        exitButton.backgroundColor = .red
        exitButton.addTarget(self, action: #selector(exitSender(_:)), for: .touchUpInside)
        exitButton.layer.cornerRadius = 5
        
    }
    @objc private func exitSender(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
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

