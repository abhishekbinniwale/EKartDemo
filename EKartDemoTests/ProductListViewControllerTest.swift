//
//  ProductListViewControllerTest.swift
//  EKartDemoTests
//
//  Created by Abhishek Binniwale on 17/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import EKartDemo

class ProductListViewControllerTest: XCTestCase {
    
    var productController : ProductListViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductListViewController") as? ProductListViewController else {
            return XCTFail("Could not instantiate ViewController from main storyboard")
        }
        productController = controller
        productController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testControllerHasTableView() {
        XCTAssertNotNil(productController.tableView, "Controller should have a tableview")
    }
    
    func testControllerHasViewModel() {
        XCTAssertNotNil(productController.viewModel, "Controller should have a view model")
    }
    
    func testTableViewHasCells() {
        let cell = productController.tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell")
        XCTAssertNotNil(cell,"TableView should be able to dequeue cell with identifier: 'Cell'")
    }
    
}
