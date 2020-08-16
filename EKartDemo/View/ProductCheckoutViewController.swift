//
//  ProductCheckoutViewController.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 14/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import UIKit

class ProductCheckoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var checkoutButton: UIButton!
    
    @IBOutlet weak var emptyCartLabel: UILabel!
    let cellId = "ProductTableViewCell"
    
    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        self.getData()
    }

    func getData(){
        viewModel.fetchDataFromDB { [weak self] in
            DispatchQueue.main.async {
                if let count = self?.viewModel.viewModels?.count {
                    self?.checkoutButton.isEnabled = count > 0 ? true : false
                    self?.emptyCartLabel.isHidden = count > 0 ? true : false
                }
                self?.tableView.reloadData()
            }
        }
    }


    @IBAction func checkoutButtonAction(_ sender: Any) {
        ///Pop from cart view and load Order placed view
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let orderView  = storyboard.instantiateViewController(withIdentifier: "OrderPlacedViewController") as? OrderPlacedViewController {
        self.navigationController?.pushViewController(orderView, animated: true)
            viewModel.deleteOrderedProductsFromDB()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.viewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ProductTableViewCell {
            if let viewModel = self.viewModel.viewModels?[indexPath.row] {
                cell.configureCellWithVM(viewModel: viewModel, isAddToCartVisible: true)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
}
