//
//  UIContainerTests.swift
//  SmootBoxTests
//
//  UIContainer Unit Tests
//

import XCTest
import Swinject
@testable import SmootBox

class UIContainerTests: XCTestCase {
    
    
    // MARK: - Properties
    var container: Container!

    
    // MARK: - setUp & tearDown
    
    override func setUp() {
        container = UIContainer.defaultContainer;
    }

    override func tearDown() {
        container = nil;
    }
    
    
    // MARK: - ViewControllers

    func testLandingViewControllerDependencies() {
        
        // When: ask container to provide a LandingViewController
        let landingViewController = container.resolve(LandingViewController.self);
        
        // Expect: instance should exists
        XCTAssertNotNil(landingViewController);
        
        // Expect: viewController should has its dependencies set
        XCTAssertNotNil(landingViewController?.presenter);
        XCTAssertTrue(landingViewController === landingViewController?.presenter.view);
        
    }
    
}
