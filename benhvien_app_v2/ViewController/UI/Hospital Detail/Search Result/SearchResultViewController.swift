//
//  SearchResultViewController.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/14/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire

class SearchResultViewController: BaseViewController {
    
    @IBOutlet weak var contentTableView: UITableView!
    let cellId = "SearchResultTableViewCell"
    var hospitals: Array<Hospital> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func setupUserInterface() {
        self.title = "Kết quả"
        showBackButton()
        contentTableView.dataSource = self
        contentTableView.delegate = self
        self.contentTableView.rowHeight = 90.0
    }

}

extension SearchResultViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? SearchResultTableViewCell
        if hospitals.count > 0 {
            let data = self.hospitals[indexPath.row]
            cell?.hospitalNameLable.text = data.name
            cell?.hospitalAddressLable.text = data.street
            cell?.hospitalPhoneNumberLable.text = data.phones[0]
            let urlImage = data.image[0]
            cell?.hospitalImageView.sd_setImage(with: URL(string: urlImage))
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.hospital = [self.hospitals[indexPath.row]]
        let nav = UINavigationController.init(rootViewController: detailVC)
        present(nav, animated: true, completion: nil)
    }
    
}
