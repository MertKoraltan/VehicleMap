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
  
  public var selectedCoordinate: Coordinate?
  public var vehicles: [Vehicle]?
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    guard let lat = selectedCoordinate?.latitude, let long = selectedCoordinate?.longitude else { return }
    
    let location = CLLocationCoordinate2D(latitude: lat,
                                          longitude: long)
    
    let viewRegion = MKCoordinateRegion(center: location,
                                        latitudinalMeters: 200,
                                        longitudinalMeters: 200)
    
    mapView.setRegion(viewRegion, animated: true)
    mapView.register(customAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

    vehicles?.forEach { vehicle in
      let location = CLLocationCoordinate2D(latitude: vehicle.coordinate.latitude,
                                            longitude: vehicle.coordinate.longitude)
      let annotation = MKPointAnnotation()
      
      annotation.title = "Latitude:\(String(format: "%.4f", location.latitude)) Longitude:\(String(format: "%.4f", location.longitude))"
      annotation.coordinate = location
      self.mapView.addAnnotation(annotation)
    }
  }
}

