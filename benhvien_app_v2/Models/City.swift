//
//  City.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class City: NSObject {
    
    var name: String!
    var district: Array<Any> = []
    
    init(with response: [String : Any]) {
        name = response["name"] as? String ?? ""
        
        let districtes = response["districtes"] as! [[String: Any]]
        //district.append(districtes)
        for dist in districtes {
            let name = dist["name"] as? String ?? ""
            district.append(name)
        }
    }
    
}









