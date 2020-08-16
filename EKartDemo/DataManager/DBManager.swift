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
    func saveDataToDB(model : ProductItem){
        let dbEntry = ProductDBModel()
        dbEntry.id = model.id
        dbEntry.name = model.name
        dbEntry.price = model.price
        dbEntry.rating = model.rating
        dbEntry.imageUrl = model.imageUrl
        
        do {
            let realm = try Realm()
            try realm.write{
                realm.add(dbEntry)
            }
        } catch let error {
            print("Error while saving realm object :\(error)")
        }
    }
    
    func fetchAllProductsAddedToCart(completion: @escaping (_ products: [ProductItem]?)->Void){
        
        ///Fetch all stored models and return viewmodel to Viewcontroller
        print("Realm DB path :\(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
        do {
             let realm = try Realm()
            var productViewModels = [ProductItem]()
            let results = realm.objects(ProductDBModel.self)
            for product in results {
                let productItem = ProductItem(id: product.id,name: product.name, price: product.price, imageUrl: product.imageUrl, rating: product.rating)
                productViewModels.append(productItem)
            }
            print("Number of products in cart :\(String(describing: productViewModels.count))")
            completion(productViewModels )
        } catch let error {
            print("Error while fetching realm object :\(error)")
            completion([])
        }
    }
    
    ///Delete all ordered products from DB
    func deleteOrderedProductsFromDB(){
        do {
        let realm = try Realm()
            let results = realm.objects(ProductDBModel.self)
            try realm.write{
                realm.delete(results)
            }
        }catch let error {
          print("Error while fetching realm object :\(error)")
        }
    }
}
