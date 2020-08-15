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
    var viewModels: [ProductViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        setUpNavigation()
        getData()
    }
    
    func setUpNavigation(){
        let cartButton = UIBarButtonItem(image: UIImage(named: "cart"), style: .done, target: self, action: #selector(goToCartAction))
        self.navigationItem.rightBarButtonItem = cartButton
    }
    
    @objc func goToCartAction(){
        ///Go to cart
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cartView  = storyboard.instantiateViewController(withIdentifier: "ProductCheckoutViewController") as? ProductCheckoutViewController
        self.navigationController?.pushViewController(cartView!, animated: true)
    }
    
    func getData(){
        NetworkingAPIManager.sharedInstance.fetchData { (productModels) in
            self.viewModels = productModels?.map({ return ProductViewModel(model: $0) }) ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ProductTableViewCell {
            if let viewModel = viewModels?[indexPath.row] {
                cell.configureCellWithVM(viewModel: viewModel)
            }
         return cell
        }
        return UITableViewCell()
    }
}
