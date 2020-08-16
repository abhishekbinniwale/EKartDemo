//
//  ProductModelTest.swift
//  EKartDemoTests
//
//  Created by Abhishek Binniwale on 16/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import EKartDemo

class ProductModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProductModel() {
        let product = Product(name: "iphone 11", price: "66000", imageUrl: "http:www.google.com", rating: 4)

        XCTAssertEqual(product.name, "iphone 11")
        XCTAssertEqual(product.price, "66000")
        XCTAssertEqual(product.imageUrl, "http:www.google.com")
        XCTAssertEqual(product.rating, 4)
    }

}
