//
//  Products.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 14/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation
/*
 "products": [
 {
   "name": "OnePlus 6 (Mirror Black 6GB RAM + 64GB memory)",
   "price": "34999",
   "image_url": "https://images-eu.ssl-images-amazon.com/images/I/41DZ309iN9L._AC_US160_.jpg",
   "rating": 4
 },
 */
struct Products : Decodable {
    let products : [Product]
    
    enum CodingKeys: String, CodingKey{
        case products = "products"
    }
}
struct Product : Identifiable,Decodable {
    let id = UUID().uuidString
    let name : String
    let price : String
    let imageUrl : String
    let rating : Int
    
    enum CodingKeys: String, CodingKey{
        case name
        case price
        case imageUrl = "image_url"
        case rating
    }
}
