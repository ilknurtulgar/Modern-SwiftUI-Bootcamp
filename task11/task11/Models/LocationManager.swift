//
//  LocationManager.swift
//  task11
//
//  Created by İlknur Tulgar on 15.10.2025.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject {
    
    @Published var loc: CLLocation? = nil
    
    @Published var address: String = ""
    
    private let manager = CLLocationManager()
    
    override init(){
        super.init()
        manager.delegate = self
        //start loc updates
        manager.desiredAccuracy = kCLLocationAccuracyBest
        requestPermission()
    }
    
    func requestPermission(){
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        case .restricted, .denied:
            print("nope")
        default:
                break
        }
    }
    
    private func getAddress(from location: CLLocation){
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location){[weak self] places,error in
            if let place = places?.first{
                var comp: [String] = []
                if let name = place.name{
                    comp.append(name)
                }
                if let city = place.locality{
                    comp.append(city)
                }
                 if let country = place.country{
                     comp.append(country)
                }
                self?.address = comp.joined(separator: ", ")
            }
        }
    }
}

extension LocationManager: CLLocationManagerDelegate{
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let latestLocation = locations.last {
            DispatchQueue.main.async {
                self.loc = latestLocation
                self.getAddress(from: latestLocation)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("didnt take loc: \(error.localizedDescription)")
    }
}
