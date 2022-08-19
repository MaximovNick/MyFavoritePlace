//
//  MapViewController.swift
//  MyFavoritePlace
//
//  Created by Nikolai Maksimov on 19.08.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var place: Place!
    let annotationIdentifier = "annotationIdentifier"
    
    @IBOutlet var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        setupPlaceMark()    }
    
    @IBAction func closeVC() {
        dismiss(animated: true)
    }
    
    private func setupPlaceMark() {
        guard let loaction = place.location else { return }
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(loaction) { placemarks, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            
            annotation.title = self.place.name
            annotation.subtitle = self.place.type
            
            guard let placemarkLocation = placemark?.location else { return }
            
            annotation.coordinate = placemarkLocation.coordinate
            
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !(annotation is MKUserLocation) else { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
        }
        if let imageData = place.imageData {
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
            imageView.image = UIImage(data: imageData)
            annotationView?.rightCalloutAccessoryView = imageView
        }
        
        return annotationView
    }
    
}
