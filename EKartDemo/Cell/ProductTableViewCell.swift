//
//  ProductTableViewCell.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 14/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import UIKit

protocol TableViewCellResponceProtocol: class {
    func addTocartButtonTaped(item : ProductItem)
}

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: CustomImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var addtoCartButton: UIButton!
    
    @IBOutlet weak var addToCartButtonHeightConstraint: NSLayoutConstraint!
    weak var tableViewCellResponcedelegate : TableViewCellResponceProtocol!
    var item : ProductItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView?.image = nil
    }
    
    func configureCellWithVM(viewModel : ProductItem, isAddToCartVisible:Bool) {
        self.item = viewModel
        self.productNameLabel.text = viewModel.name
        self.productPriceLabel.text = "Price: \(viewModel.price)₹"
        self.ratingLabel.text = "Rating: \(viewModel.rating)/5"
        self.productImage.loadImageUsingUrl(urlSting: viewModel.imageUrl)
        self.addtoCartButton.isHidden = isAddToCartVisible
       // self.addToCartButtonHeightConstraint.constant = !isAddToCartVisible ? 33.0 : 10.0
        self.addtoCartButton.layer.cornerRadius = self.addtoCartButton.frame.height / 2
    }
    
    
    @IBAction func addToCardAction(_ sender: Any) {
        //Save it to DB to show in cart
        if let item = self.item {
        self.tableViewCellResponcedelegate.addTocartButtonTaped(item: item)
        }
    }
    
}
