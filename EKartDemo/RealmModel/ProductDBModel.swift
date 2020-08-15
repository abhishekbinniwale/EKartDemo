//
//  ProductDBModel.swift
//  EKartDemo
//
//  Created by Abhishek Binniwale on 15/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import Foundation
import RealmSwift

class ProductDBModel: Object {
    @objc dynamic var id : String = ""
    @objc dynamic var  name : String = ""
    @objc dynamic var price : String = ""
    @objc dynamic var imageUrl : String = ""
    @objc dynamic var rating : Int = 0
}
