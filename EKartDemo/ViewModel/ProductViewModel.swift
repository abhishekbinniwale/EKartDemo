//
//  ProductViewModel.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 14/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation

class ProductViewModel: NSObject {
    var id : UUID
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
}
