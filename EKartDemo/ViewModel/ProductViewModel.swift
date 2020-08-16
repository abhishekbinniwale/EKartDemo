//
//  ProductViewModel.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 14/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation

class ProductItem {
    var id : String
    var name : String
    var price : String
    var imageUrl : String
    let rating : Int
    
    //Dependecy Injection
    init(model : Product) {
        self.id = model.id
        self.name = model.name
        self.price = model.price
        self.imageUrl = model.imageUrl
        self.rating = model.rating
    }
    
    init(id : String,name : String,price : String,imageUrl : String, rating : Int) {
        self.id = id
        self.name = name
        self.price = price
        self.imageUrl = imageUrl
        self.rating = rating
    }
}

class ProductViewModel {
    
    var viewModels : [ProductItem]?
    
    func fetchDataFromServer(compeltion: @escaping ()->Void ) {
        NetworkingAPIManager.sharedInstance.fetchData { [weak self] (productModels) in
            let viewModels = productModels?.map({ return ProductItem(model: $0) }) ?? []
            self?.viewModels = viewModels
            compeltion()
        }
    }
    
    func fetchDataFromDB(compeltion: @escaping ()->Void ){
        DBManager.sharedInstance.fetchAllProductsAddedToCart { [weak self] (produtModels) in
            self?.viewModels = produtModels ?? []
            compeltion()
        }
    }
    
    func deleteOrderedProductsFromDB(){
        DBManager.sharedInstance.deleteOrderedProductsFromDB()
    }
    
    func addProductToDB(item : ProductItem){
        DBManager.sharedInstance.saveDataToDB(model: item)
    }
}


