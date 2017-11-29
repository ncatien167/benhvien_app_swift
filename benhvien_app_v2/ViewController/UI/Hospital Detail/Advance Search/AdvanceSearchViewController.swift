//
//  AdvanceSearchViewController.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/28/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import IQDropDownTextField
import Alamofire

class AdvanceSearchViewController: BaseViewController {

    @IBOutlet weak var cityDropDownTextField: IQDropDownTextField!
    @IBOutlet weak var districtDropDownTextField: IQDropDownTextField!
    
    var districtesArray: Array<String> = []
    var cityArray: Array<City> = []
    var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getAllCities()
        cityDropDownTextField.delegate = self
        districtDropDownTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func getAllCities() {
        self.showHUD(view: self.view)
        APIController.request(manager: .cities) { (error, response) in
            self.hideHUD(view: self.view)
            if response != nil {
                let data = response!["data"].dictionaryValue
                let dataObject = data["cities"]?.arrayObject
                for cities in dataObject! {
                    self.city = City(with: cities as! [String : Any])
                    self.cityArray.append(self.city)
                }
                print(self.cityArray)
                self.setupDropDownTextField()
            } else {
                
            }
        }
    }
    
    func getHospitalWith(city: String) {
        let parameter: Parameters = [APIKeyword.Hospital.city : city]
        self.showHUD(view: self.view)
        APIController.request(manager: .searchByCity, params: parameter) { (error, response) in
            self.hideHUD(view: self.view)
            if response != nil {
                let data = response!["data"].dictionaryValue
                print(data)
            } else {
                
            }
        }
    }
    
    @IBAction func advanceSearchButtonPressed(_ sender: Any) {
        getHospitalWith(city: cityDropDownTextField.selectedItem!)
    }
}

extension AdvanceSearchViewController: IQDropDownTextFieldDelegate {
    
    func getCityArray() -> Array<Any> {
        var cityArray: Array<String> = []
        for cities in self.cityArray {
            cityArray.append(cities.name)
        }
        return cityArray
    }
    
    func getDictrictCity(city: City) -> Array<Any> {
        var dictrictWithCity: Array<Any> = []
        dictrictWithCity = city.district
        return dictrictWithCity
    }
    
    func setupDropDownTextField() {
        cityDropDownTextField.isOptionalDropDown = false
        cityDropDownTextField.itemList = getCityArray() as? [String]
        
        let selectedCity: City = self.cityArray[0]
        districtDropDownTextField.isOptionalDropDown = false
        districtDropDownTextField.itemList = getDictrictCity(city: selectedCity) as? [String]
    }
    
    func textField(_ textField: IQDropDownTextField, didSelectItem item: String?) {
        let selectIndex = textField.selectedRow
        if textField == cityDropDownTextField {
            let city: City = self.cityArray[selectIndex]
            self.districtDropDownTextField.itemList = getDictrictCity(city: city) as? [String]
            self.districtDropDownTextField.selectedRow = 0
        }
    }
    
}

