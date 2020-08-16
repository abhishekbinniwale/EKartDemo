//
//  NetworkAPIManagerTest.swift
//  EKartDemoTests
//
//  Created by Abhishek Binniwale on 16/08/20.
//  Copyright © 2020 Abhishek Binniwale. All rights reserved.
//

import XCTest
@testable import EKartDemo

class NetworkAPIManagerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchDataFromServer() {
        NetworkingAPIManager.sharedInstance.fetchData { (product) in
            XCTAssertNotNil(product)
        }
    }

}
