//
//  APIManager.swift
//  Demo_Story_App
//
//  Created by Apple on 11/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Alamofire

enum APIManager {
 
    case login
    case searchByName
    case searchByCity
    case searchByDistrictCity
    case cities
}

extension APIManager {
    
    var baseURL: String { return "https://benhvien-app.herokuapp.com/api/v1/" }
    
    //MARK: - URL
    
    var url: String {
        
        var path = ""

        switch self {
        case .login:
            path = "authenticate"
        case .searchByName:
            path = "hospitals-name"
        case .searchByCity:
            path = ""
        case .searchByDistrictCity:
            path = ""

        case .cities:
            path = "cities"
        }
        
        return baseURL + path
    }
    
    //MARK: - METHOD
    
    var method: HTTPMethod {
        
        switch self {
        case .login:
            return .post
        case .searchByName:
            return .get
        case .searchByCity:
            return .get
        case .searchByDistrictCity:
            return .get
        case .cities:
            return .get
        }
    }
        
    //MARK: - ENCODING
    
    var encoding: ParameterEncoding {
        
        switch self {
        case .login:
            return JSONEncoding.default
        case .searchByName:
            return URLEncoding.default
        case .searchByCity:
            return URLEncoding.default
        case .searchByDistrictCity:
            return URLEncoding.default
        case .cities:
            return URLEncoding.default
        }
        
    }
    
    //MARK: - HEADER
    
    var header: [String : String]? {
        
        switch self {
        case .login:
            return [:]
        case .searchByName:
            return [Header.authorization : "JWT \(UserDefaults.standard.value(forKey: "UserToken") as! String)",
                    Header.contentType : Header.Content.application]
        case .searchByCity:
            return [:]
        case .searchByDistrictCity:
            return [:]
        case .cities:
            return [:]
        }
        
    }
    
}














