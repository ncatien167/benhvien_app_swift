//
//  DirectionCell.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import GoogleMaps

class DirectionCell: UITableViewCell {

    
    @IBOutlet weak var mapView: GMSMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func bindData(hospital: Hospital) {
        
        let camera = GMSCameraPosition.camera(withLatitude: hospital.latitude, longitude: hospital.longitude, zoom: 15)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true

        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: hospital.latitude, longitude: hospital.longitude)
        marker.title = hospital.name
        marker.map = mapView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
