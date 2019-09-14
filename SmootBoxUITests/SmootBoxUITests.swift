//
//  SmootBoxUITests.swift
//  SmootBoxUITests
//
//  Created by Ilbert Esculpi on 5/1/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import XCTest

class SmootBoxUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {

        continueAfterFailure = false

        app = XCUIApplication()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchScreen() {
        
        app.launch()
        
        // Expect:
        XCTAssertTrue(app.buttons["Sign in later"].exists);
        XCTAssertTrue(app.images["Logo"].exists);
        
    }

}
