//
//  SlideMenuView.swift
//  benhvien_app_v2
//
//  Created by AnhTien on 11/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class SettingSlideMenu: NSObject {
    
    let name: String
    let imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

class SlideMenuView: NSObject {
    
    let menuView = UIView()
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .gray
        return cv
    }()
    
    let cellId = "cellId"
    
    let settings: [SettingSlideMenu] = {
        return [SettingSlideMenu(name: "Tìm kiếm", imageName: "search-menu-icon"),
                SettingSlideMenu(name: "Thông tin", imageName: "information-menu-icon"),
                SettingSlideMenu(name: "Đăng xuất", imageName: "logout-icon")]
    }()
    
    func showSlideMenu() {
        
        if let window = UIApplication.shared.keyWindow {
            menuView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            menuView.frame = window.frame
            menuView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(menuView)
            window.addSubview(topView)
            
            let width: CGFloat = (300.0/375.0) * window.frame.size.width
            let x = window.frame.width - width
            topView.frame = CGRect(x: window.frame.width, y: 0, width: width, height: window.frame.height)
            
            menuView.frame = window.frame
            menuView.alpha = 0
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.menuView.alpha = 1
                
                self.topView.frame = CGRect(x: x, y: 0, width: self.topView.frame.width, height: self.topView.frame.height)
                
            }, completion: nil)
        }
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 1.0) {
            self.menuView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.topView.frame = CGRect(x: window.frame.height, y: 0, width: self.topView.frame.width, height: self.topView.frame.height)
            }
        }
    }
    
    func setupCollectionView() {
        
        topView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        topView.addConstrinsWithFormat(format: "H:|[v0]|", views: collectionView)
        topView.addConstrinsWithFormat(format: "V:|-40-[v0]|", views: collectionView)
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SlideViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override init() {
        super.init()
        setupCollectionView()
    }
}

extension SlideMenuView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SlideViewCell
        let setting = settings[indexPath.row]
        cell.setting = setting
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}










