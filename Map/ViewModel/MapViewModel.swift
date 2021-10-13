//
//  MapViewModel.swift
//  Map
//
//  Created by NGUYEN DUY KHUONG on 2021/07/11.
//

import SwiftUI
import MapKit
import CoreLocation

class MapViewModel: NSObject,ObservableObject,CLLocationManagerDelegate{
    
    @Published var mapView = MKMapView()
    
    @Published var region : MKCoordinateRegion!
    
    @Published var permissionDenied = false
    
    @Published var mapType : MKMapType = .standard

    
    @Published var searchTxt = ""

    
    @Published var places : [Place] = []
    
    func updateMapType(){
        if mapType == .standard{
            mapType = .hybrid
            mapView.mapType = mapType
        }
        else{
            mapType = .standard
            mapView.mapType = mapType
        }
    }
    
    func focusLocation(){
        
        guard let _ = region else{return}
        
        mapView.setRegion(region,animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    func searchQuery(){
        
        places.removeAll()
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTxt
        
        MKLocalSearch(request: request).start { (response, _) in
            
            guard let result = response else{return}
            
            self.places = result.mapItems.compactMap({ (item) -> Place? in
                return Place(placemark: item.placemark)
            })
        }
    }
    
    func selectPlace(place: Place){
        
        searchTxt = ""
        
        guard let coordinate = place.placemark.location?.coordinate else{return}
        
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.coordinate = coordinate
        pointAnnotation.title = place.placemark.name ?? "No Name"
        
        mapView.removeAnnotations(mapView.annotations)
        
        mapView.addAnnotation(pointAnnotation)
        
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
        
        case .denied:
            permissionDenied.toggle()
            
        case .notDetermined:
            manager.requestWhenInUseAuthorization()

        case .authorizedWhenInUse:
            manager.requestLocation()
            
        default:
            ()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        //Error
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{return}
        
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        // Updating Map
        self.mapView.setRegion(self.region, animated: true)
        
        // Smooth Animations
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
    }
}


