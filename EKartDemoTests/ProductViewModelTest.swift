//
//  ProductViewModelTest.swift
//  EKartDemoTests
//
//  Created by Abhishek Binniwale on 16/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import EKartDemo
class ProductViewModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testProductViewModel() {
        
        let product1 = Product(name: "iphone 11", price: "66000", imageUrl: "http:www.google.com", rating: 4)
        let productItem1 = ProductItem(model: product1)
       
        let product2 = Product(name: "iphone 11", price: "66000", imageUrl: "http:www.google.com", rating: 4)
        let productItem2 = ProductItem(model: product2)
        
        let product3 = Product(name: "iphone 11", price: "66000", imageUrl: "http:www.google.com", rating: 4)
        let productItem3 = ProductItem(model: product3)
        
        let productViewModel = ProductViewModel()
        productViewModel.viewModels = [productItem1,productItem2,productItem3]
        
        XCTAssertEqual(productViewModel.viewModels?.count, 3)
    }
    
    func testfetchDataFromDB(){
        ///This may fail when there is nothing in DB
        DBManager.sharedInstance.fetchAllProductsAddedToCart { (products) in
            XCTAssertNotNil(products)
        }
        
    }
    

}
