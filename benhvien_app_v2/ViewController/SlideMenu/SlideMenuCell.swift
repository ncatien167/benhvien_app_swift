//
//  SlideMenuCell.swift
//  benhvien_app_v2
//
//  Created by AnhTien on 11/12/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class SlideViewCell: BaseCell {
    
    var setting: SettingSlideMenu? {
        didSet {
            nameLable.text = setting?.name
            //if let imageName = setting?.imageName {
            iconImageView.image = UIImage(named: (setting?.imageName)!)
            //}
        }
    }
    
    let nameLable: UILabel = {
        let lable = UILabel()
        lable.text = "Setting"
        return lable
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(nameLable)
        addSubview(iconImageView)
        
        addConstrinsWithFormat(format: "H:|-20-[v0(30)]-10-[v1]|", views: iconImageView, nameLable)
        addConstrinsWithFormat(format: "V:|[v0]|", views: nameLable)
        addConstrinsWithFormat(format: "V:[v0(30)]", views: iconImageView)
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0))
    }
}





