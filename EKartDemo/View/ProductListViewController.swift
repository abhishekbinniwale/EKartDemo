//
//  ProductListViewController.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 14/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellId = "ProductTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        NetworkingAPIManager.sharedInstance.fetchData()
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ProductTableViewCell {
            
         return cell
        }
        
        return UITableViewCell()
    }
}
