//
//  NameCell.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func bindData(hospital: Hospital) {
        nameLabel.text = hospital.name
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
