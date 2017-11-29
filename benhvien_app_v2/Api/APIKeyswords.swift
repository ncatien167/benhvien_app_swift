//
//  APIKeyswords.swift
//  Demo_Story_App
//
//  Created by Apple on 11/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation


struct APIKeyword {
    
    static let error        = "errors"
    
    struct Login {
        
        static let email = "email"
        static let password = "password"
        
    }
    
    struct Hospital {
        static let city = "city"
        static let district = "district"
    }
    
}

struct Header {
    
    static let authorization        = "Authorization"
    static let contentType          = "Content-Type"
    
    struct Content {
        static let application      = "application/json"
    }
    
}
