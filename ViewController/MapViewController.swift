//
//  MapViewController.swift
//  Eateries
//
//  Created by Илья Федорченко on 02/01/2019.
//  Copyright © 2019 Илья Федорченко. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  var restaurant: Restaurant!
  
  @IBOutlet weak var mapView: MKMapView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(restaurant.location) {
      (placemarks, error) in
      guard error == nil else {return}
      guard let placemarks = placemarks else {return}
      
      let placemark = placemarks.first!
      let annotation = MKPointAnnotation()
      annotation.title = self.restaurant.name
      annotation.subtitle = self.restaurant.type
      
      guard let location = placemark.location else {return}
      annotation.coordinate = location.coordinate
      self.mapView.showAnnotations([annotation], animated: true)
      self.mapView.selectAnnotation(annotation, animated: true)
    }
    
  }
  
}
