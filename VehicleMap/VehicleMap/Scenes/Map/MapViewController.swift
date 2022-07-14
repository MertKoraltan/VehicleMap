//
//  MapViewController.swift
//  VehicleMap
//
//  Created by Mert Koraltan on 6.07.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  
  public var coordinate: Coordinate?
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    guard let lat = coordinate?.latitude, let long = coordinate?.longitude else { return }
    
    let location = CLLocationCoordinate2D(latitude: lat,
                                          longitude: long)
    
    let viewRegion = MKCoordinateRegion(center: location,
                                        latitudinalMeters: 200,
                                        longitudinalMeters: 200)
    mapView.setRegion(viewRegion, animated: true)
    
    
    let annotation = MKPointAnnotation()

    annotation.coordinate = location
    mapView.addAnnotation(annotation)
  }
}
