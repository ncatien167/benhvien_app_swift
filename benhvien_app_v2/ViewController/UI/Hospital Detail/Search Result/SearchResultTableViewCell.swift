//
//  SearchResultTableViewCell.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/14/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var hospitalImageView: UIImageView!
    @IBOutlet weak var hospitalNameLable: UILabel!
    @IBOutlet weak var hospitalPhoneNumberLable: UILabel!
    @IBOutlet weak var hospitalAddressLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
