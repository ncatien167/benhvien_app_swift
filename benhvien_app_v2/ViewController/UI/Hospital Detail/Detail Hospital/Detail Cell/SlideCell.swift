//
//  SlideCell.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class SlideCell: UITableViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    var slideImage: UIImage!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func bindData(hospital: Hospital) {
        slideImageView.sd_setImage(with: URL(string: hospital.image[0]))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
