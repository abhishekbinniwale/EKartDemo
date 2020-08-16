//
//  DBManager.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 14/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    
    static let sharedInstance = DBManager()
    
    private init() {    }
    
    ///Add Product to cart for offline storage
    func saveDataToDB(viewModel : ProductViewModel){
        let dbEntry = ProductDBModel()
        dbEntry.id = viewModel.id
        dbEntry.name = viewModel.name
        dbEntry.price = viewModel.price
        dbEntry.rating = viewModel.rating
        dbEntry.imageUrl = viewModel.imageUrl
        
        do {
            let realm = try Realm()
            try realm.write{
                realm.add(dbEntry)
            }
        } catch let error {
            print("Error while saving realm object :\(error)")
        }
    }
    
    func fetchAllProductsAddedToCart(completion: @escaping (_ products: [ProductViewModel])->Void){
        
        ///Fetch all stored models and return viewmodel to Viewcontroller
        print("Realm DB path :\(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
        do {
             let realm = try Realm()
            var productViewModels : [ProductViewModel]?
            let results = realm.objects(ProductDBModel.self)
            for product in results {
                let productViewModel = ProductViewModel(id: product.id, name: product.name, price: product.price, imageUrl: product.imageUrl, rating: product.rating)
                productViewModels?.append(productViewModel)
            }
            print("Number of products in cart :\(String(describing: productViewModels?.count))")
            completion(productViewModels ?? [])
        } catch let error {
            print("Error while fetching realm object :\(error)")
            completion([])
        }
    }
}
