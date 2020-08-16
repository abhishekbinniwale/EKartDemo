//
//  ProductListViewController.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 14/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , TableViewCellResponceProtocol{

    @IBOutlet weak var tableView: UITableView!
    let cellId = "ProductTableViewCell"
    private var viewModel = ProductViewModel()
    
    
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
        viewModel.fetchDataFromServer { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.viewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ProductTableViewCell {
            if let viewModel = viewModel.viewModels?[indexPath.row] {
                cell.configureCellWithVM(viewModel: viewModel, isAddToCartVisible: false)
            }
            cell.tableViewCellResponcedelegate = self
         return cell
        }
        return UITableViewCell()
    }
    
    func addTocartButtonTaped(item: ProductItem) {
        self.viewModel.addProductToDB(item: item)
        let alert = UIAlertController(title: "Added TO Cart", message: "\(item.name) added to your cart", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { (action) in }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
