//
//  AppDelegate.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/9/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import GoogleMaps
import OCGoogleDirectionsAPI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if UserDefaults.standard.value(forKey: "UserToken") != nil {
            setupHomeViewController()
        } else {
            setupLoginViewController()
        }
        setupApplication()
        return true
    }
    
    func setupApplication() {
        GMSServices.provideAPIKey("AIzaSyCk77_rbSukbCgHqzUW4mWT2D92JhnuacE")
        DispatchQueue.main.async {
            OCDirectionsAPIClient.provideAPIKey("AIzaSyCk77_rbSukbCgHqzUW4mWT2D92JhnuacE")
        }
        
    }
    
    func setupLoginViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.window?.rootViewController = loginViewController
        self.window?.makeKeyAndVisible()
    }
    
    func setupHomeViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let navigationController = UINavigationController.init(rootViewController: homeViewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }

}

