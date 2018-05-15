//
//  DetailViewController.swift
//  surya1
//
//  Created by Sahil Dhawan on 15/05/18.
//  Copyright © 2018 Sahil Dhawan. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController {
    
    //MARK: Outlets
    let tableView = UITableView()
    
    //MARK: Variables
    var detailDictArray : [realmItemsObject] = []
    var email : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        //fetch data from realm first
        NetworkCalls().fetchFromRealm { (items) in
            self.detailDictArray = items!
            self.tableView.reloadData()
            
            //fetch data from network
            NetworkCalls().fetchDataFromApi(email: self.email) { (items, error) in
                if let errorString = error {
                    self.showAlert(msg: errorString)
                } else {
                    self.detailDictArray = items!
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    //setup table view
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.frame = CGRect(x: 0, y: 0, width: Constants.frameWidth, height: Constants.frameHeight)
        let detailNib = UINib(nibName: "DetailTableViewCell", bundle: nil)
        tableView.register(detailNib, forCellReuseIdentifier: "dataCell")
        self.view.addSubview(tableView)
    }
}

//MARK: TableView DataSource
extension DetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailDictArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DetailTableViewCell
        cell.selectionStyle = .none
        let realmItem = detailDictArray[indexPath.item]
        
        //fetching values from realm
        let firstName = realmItem.value(forKey: "firstName") as! String
        let lastName = realmItem.value(forKey: "lastName") as! String
        let imageUrl = realmItem.value(forKey: "imageUrl") as! String
        let emailId = realmItem.value(forKey: "emailId") as! String
        
        //passing realm values to tableviewcell
        cell.nameLabel.text = firstName + " " + lastName
        cell.emailLabel.text = emailId
        let urlString = imageUrl
        let url = URL(string : urlString)
        if cell.detailImageView.image == nil {
            do {
                let imageData = try Data(contentsOf: url!)
                let image = UIImage(data: imageData)
                cell.detailImageView.image = image
            } catch {
                print("invalid Image")
            }
        }
        return cell
    }
}

extension DetailViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
