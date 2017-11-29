//
//  DetailViewController.swift
//  benhvien_app_v2
//
//  Created by Apple on 11/27/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: BaseViewController {

    @IBOutlet weak var contentTableView: UITableView!
    var hospital: [Hospital] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func setupUserInterface() {
        setupContentTableView()
        showBackButton()
        showDirectionButton()
        contentTableView.reloadData()
    }

    func setupContentTableView() {
        contentTableView.delegate = self
        contentTableView.dataSource = self
        contentTableView.register(UINib(nibName: "SlideCell", bundle: nil), forCellReuseIdentifier: "SlideCell")
        contentTableView.register(UINib(nibName: "NameCell", bundle: nil), forCellReuseIdentifier: "NameCell")
        contentTableView.register(UINib(nibName: "AddressAndPhoneCell", bundle: nil), forCellReuseIdentifier: "AddressAndPhoneCell")
        contentTableView.register(UINib(nibName: "DescriptionCell", bundle: nil), forCellReuseIdentifier: "DescriptionCell")
        contentTableView.register(UINib(nibName: "DirectionCell", bundle: nil), forCellReuseIdentifier: "DirectionCell")
    }
    
    func showDirectionButton() {
        let btn = UIBarButtonItem(image: UIImage(named: "direction-icon"), style: .plain, target: self, action: #selector(directionButtonPressed(_:)))
        navigationItem.rightBarButtonItem = btn
    }
    
    @IBAction func directionButtonPressed(_ sender: Any) {
        let directionVc = storyboard?.instantiateViewController(withIdentifier: "DirectionViewController") as! DirectionViewController
        directionVc.hospital = self.hospital
        let navc = UINavigationController.init(rootViewController: directionVc)
        present(navc, animated: true, completion: nil)
    }
    
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.hospital.count > 0 {
            let hos = self.hospital[indexPath.row]
            self.navigationItem.title = hos.name
            
            if indexPath.row == 0 && indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SlideCell", for: indexPath) as! SlideCell
                cell.bindData(hospital: hos)
                return cell
            }
            if indexPath.row == 0 && indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath) as! NameCell
                cell.bindData(hospital: hos)
                return cell
            }
            if indexPath.row == 0 && indexPath.section == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddressAndPhoneCell", for: indexPath) as! AddressAndPhoneCell
                cell.bindData(hospital: hos)
                return cell
            }
            if indexPath.row == 0 && indexPath.section == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddressAndPhoneCell", for: indexPath) as! AddressAndPhoneCell
                cell.bindData(hospital: hos)
                return cell
            }
            if indexPath.row == 0 && indexPath.section == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
                cell.bindData(hospital: hos)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DirectionCell", for: indexPath) as! DirectionCell
                cell.bindData(hospital: hos)
                return cell
            }
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
            
            return cell
        }
    }
}
















