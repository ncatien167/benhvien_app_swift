//
//  DescriptionCell.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {

    @IBOutlet weak var descriptionLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func bindData(hospital: Hospital) {
        descriptionLable.text = hospital.hospitalDescription
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
