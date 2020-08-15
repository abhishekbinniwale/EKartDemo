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
    
    func saveDataToDB(viewModel : ProductViewModel){

    }
    
    func fetchAllProductsAddedToCart(completion: @escaping (_ products: [ProductViewModel])->Void){
        
    }
}
