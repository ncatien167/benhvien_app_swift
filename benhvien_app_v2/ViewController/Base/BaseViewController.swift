//
//  BaseViewController.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/10/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import MBProgressHUD

class BaseViewController: UIViewController {

    let slideMenu = SlideMenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUserInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setupUserInterface() {
        
    }
    
    func showHUD(view: UIView) {
        let showHUD = MBProgressHUD.showAdded(to: view, animated: true)
        showHUD.label.text = "Loading"
        showHUD.detailsLabel.text = "Please wait..."
    }
    
    func hideHUD(view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    func showAlertMessageWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Đồng ý", style: .cancel, handler: nil))
    }
    
    func showBackButton() {
        let image = UIImage(named: "nav-back")
        let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backButtonPressed(_:)))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func showMenuButton() {
        let image = UIImage(named: "nav-menu")
        let menuButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(menuButtonPressed(_:)))
        self.navigationItem.leftBarButtonItem = menuButton
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        slideMenu.showSlideMenu()
    }
    
}
