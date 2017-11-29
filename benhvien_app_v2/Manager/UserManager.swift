//
//  UserManager.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    
    var userId: String!
    var role: String!
    var email: String!
    var city: String!
    var token: String!
    var fullName: String!
    
    static let shared = UserManager()
    
    private override init(){}
    
    func setToken(with response: [String : Any]) {
       
        userId = response["userId"] as? String
        if !userId.isEmpty {
            UserDefaults.standard.set(userId, forKey: "UserId")
        }
            
        role = response["role"] as? String ?? ""
        if !role.isEmpty {
            UserDefaults.standard.set(role, forKey: "UserRole")
        }
            
        email = response["email"] as? String ?? ""
        if !email.isEmpty {
            UserDefaults.standard.set(email, forKey: "UserEmail")
        }
            
        city = response["city"] as? String ?? ""
        if !city.isEmpty {
            UserDefaults.standard.set(city, forKey: "UserCity")
        }
            
        token = response["token"] as? String ?? ""
        if !token.isEmpty {
            UserDefaults.standard.set(token, forKey: "UserToken")
        }
            
        fullName = response["fullName"] as? String ?? ""
        if !fullName.isEmpty {
            UserDefaults.standard.set(fullName, forKey: "UserFullName")
        }
        
        UserDefaults.standard.synchronize()
    }
    
    

}
