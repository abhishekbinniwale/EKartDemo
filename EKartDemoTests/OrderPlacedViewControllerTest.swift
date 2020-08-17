//
//  OrderPlacedViewControllerTest.swift
//  EKartDemoTests
//
//  Created by Abhishek Binniwale on 17/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import EKartDemo

class OrderPlacedViewControllerTest: XCTestCase {
    
    var productController : OrderPlacedViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OrderPlacedViewController") as? OrderPlacedViewController else {
            return XCTFail("Could not instantiate ViewController from main storyboard")
        }
        productController = controller
        productController.loadViewIfNeeded()
    }
    
    func testControllerHasContinueShoppingButton() {
        XCTAssertNotNil(productController.continueShoppingButton, "Controller should have a continueShoppingButton")
    }
    
    func testControllerHasLoadingView() {
        XCTAssertNotNil(productController.loadingView, "Controller should have a loadingView")
    }
    
    func testControllerHasIndicatorview() {
        XCTAssertNotNil(productController.indicatorview, "Controller should have a indicatorview")
    }
    func testControllerHasLoadingLabel() {
        XCTAssertNotNil(productController.loadingLabel, "Controller should have a loadingLabel")
    }
    
}
