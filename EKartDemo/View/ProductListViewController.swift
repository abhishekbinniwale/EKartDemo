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
    var viewModel = ProductViewModel()
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
        
        self.showActivityIndicator(uiView: self.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.hideActivityIndicator(uiView: self.view)
            let alert = UIAlertController(title: "Added TO Cart", message: "\(item.name) added to your cart", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel) { (action) in }
            alert.addAction(action)
            alert.view.tintColor = UIColor.black
            self.present(alert, animated: true, completion: nil)
        }
    }
    func showActivityIndicator(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColorFromHex(rgbValue:0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColorFromHex(rgbValue:0xcccccc, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
    func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}
