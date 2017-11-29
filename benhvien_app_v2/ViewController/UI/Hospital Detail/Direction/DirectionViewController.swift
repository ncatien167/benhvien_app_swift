//
//  DirectionViewController.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import GoogleMaps
import OCGoogleDirectionsAPI

class DirectionViewController: BaseViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    var hospital: [Hospital] = []
    var locationManager = CLLocationManager()
    var currentLocation = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func setupUserInterface() {
        showBackButton()
        
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func drawDirectionWithOriginLocation(origin: CLLocation, destinationLocation: CLLocation) {
        
        DispatchQueue.main.async {
            OCDirectionsAPIClient.provideAPIKey("AIzaSyCk77_rbSukbCgHqzUW4mWT2D92JhnuacE")
        }
        let client = OCDirectionsAPIClient()
        let request = OCDirectionsRequest(originLocation: origin, andDestinationLocation: destinationLocation)
        
        _ = client?.directions(request, response: { (response, error) in
            if (error != nil) {
                return
            }
            if (response?.status != OCDirectionsResponseStatus.OK) {
                return
            }
            let routesArray = response?.routes
            var polyline =  GMSPolyline()
            if routesArray != nil {
                let route: OCDirectionsRoute = (response?.route())!
                let overViewPolyline: OCDirectionsPolyline = route.overviewPolyline
                let points = overViewPolyline.points
                DispatchQueue.main.async {
                    let path = GMSPath(fromEncodedPath: points!)
                    polyline = GMSPolyline.init(path: path)
                    polyline.strokeColor = .blue
                    polyline.strokeWidth = 10.0
                    polyline.map = self.mapView
                }
            }
        })
    }
    
    //MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = (locations.last?.coordinate)!
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withTarget: currentLocation, zoom: 15)
        self.mapView.camera = camera
        self.mapView.isMyLocationEnabled = true
        self.mapView.settings.myLocationButton = true
        
        let marker: GMSMarker = GMSMarker.init(position: currentLocation)
        marker.title = "My Location"
        marker.appearAnimation = .pop
        marker.map = self.mapView
        locationManager.stopUpdatingLocation()
        for hos in hospital {
            self.drawDirectionWithOriginLocation(origin: CLLocation.init(latitude: self.currentLocation.latitude, longitude: self.currentLocation.longitude), destinationLocation: CLLocation.init(latitude: hos.latitude, longitude: hos.longitude))
        }
    }

}
