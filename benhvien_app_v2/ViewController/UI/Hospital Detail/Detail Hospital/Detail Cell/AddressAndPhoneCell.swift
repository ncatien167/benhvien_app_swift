//
//  AddressAndPhoneCell.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class AddressAndPhoneCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func bindData(hospital: Hospital) {
        infoLabel.text = hospital.street
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
