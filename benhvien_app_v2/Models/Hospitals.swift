//
//  Hospitals.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/15/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class Hospital: NSObject {
    
    var hospitalId: String!
    var avatar: String!
    var city: String!
    var hospitalDescription: String!
    var district: String!
    var image: Array<String>!
    var latitude: Double!
    var longitude: Double!
    var name: String!
    var phones: Array<String>!
    var street: String!
    
    init(with response: [[String: Any]]) {
        
        for dataRespone in response {
            hospitalId = dataRespone["_id"] as? String ?? ""
            avatar = dataRespone["avatar"] as? String ?? ""
            city = dataRespone["city"] as? String ?? ""
            hospitalDescription = dataRespone["description"] as? String ?? ""
            district = dataRespone["district"] as? String ?? ""
            image = dataRespone["images"] as? Array<String> ?? []
            latitude = dataRespone["latitude"] as? Double ?? -1
            longitude = dataRespone["longitude"] as? Double ?? -1
            name = dataRespone["name"] as? String ?? ""
            phones = dataRespone["phones"] as? Array<String> ?? []
            street = dataRespone["street"] as? String ?? ""
        }
    }
}
//
//class func all(){
//    
//    
//}

