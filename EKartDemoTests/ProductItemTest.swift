//
//  ProductItemTest.swift
//  EKartDemoTests
//
//  Created by Abhishek Binniwale on 16/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import EKartDemo
class ProductItemTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProductItem() {
        let product = Product(name: "iphone 11", price: "66000", imageUrl: "http:www.google.com", rating: 4)
        let productItem = ProductItem(model: product)
        
        XCTAssertEqual(product.name, productItem.name)
        XCTAssertEqual(product.price, productItem.price)
        XCTAssertEqual(product.imageUrl, productItem.imageUrl)
        XCTAssertEqual(product.rating, productItem.rating)
    }

}
