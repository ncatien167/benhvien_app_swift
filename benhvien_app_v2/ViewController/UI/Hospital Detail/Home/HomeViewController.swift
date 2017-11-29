//
//  HomeViewController.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/10/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: BaseViewController {

    @IBOutlet weak var searchTextField: UITextField!
    var hospitals: Array<Hospital> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = UserDefaults.standard.value(forKey: "UserToken") as? String {
            print("Token : \(token)")
        }
        //testLoginToGetAccessToken()
    }
    
    override func setupUserInterface() {
        showMenuButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func testLoginToGetAccessToken() {
        let email = "ncatien167@gmail.com"
        let password = "11111111"
        let parameters: Parameters = [
            APIKeyword.Login.email : email,
            APIKeyword.Login.password : password
        ]
        APIController.request(manager: .login, params: parameters) { (error, response) in
            if error == nil {
                let data = response!["data"].dictionaryObject
                UserManager.shared.setToken(with: data!)
                print(UserManager.shared.token)
            } else {
                
            }
        }
    }
    
    func testNewRequset() {
        let hospitalName = searchTextField.text
        let parameters: Parameters = [
            "name": hospitalName!
        ]
        self.showHUD(view: self.view)
        APIController.request(manager: .searchByName, params: parameters) { (error, response) in
            self.hideHUD(view: self.view)
            let data = response!["data"].dictionaryValue
            let hospitalArray = data["hospitals"]?.arrayObject
            for hospitals in hospitalArray! {
                let hospital = Hospital(with: [hospitals as! Dictionary<String, Any>])
                self.hospitals.append(hospital)
            }
            self.goToSearchResultWith(hospitals: self.hospitals)
        }
    }
    
    func goToSearchResultWith(hospitals: [Hospital]) {
        let searchResultVc = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController
        searchResultVc.hospitals = self.hospitals
        let nav = UINavigationController.init(rootViewController: searchResultVc)
        self.present(nav, animated: true, completion: nil)
    }
    
    @IBAction func searchButonPressed(_ sender: Any) {
        testNewRequset()
    }
    
    @IBAction func advanceSearchButtonPressed(_ sender: Any) {
        let advanceSearch = self.storyboard?.instantiateViewController(withIdentifier: "AdvanceSearchViewController") as! AdvanceSearchViewController
        let nav = UINavigationController.init(rootViewController: advanceSearch)
        self.present(nav, animated: true, completion: nil)
    }
    
}
