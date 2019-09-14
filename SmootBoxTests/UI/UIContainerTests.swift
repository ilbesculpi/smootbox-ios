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
        let controller = container.resolve(LandingViewController.self);
        
        // Expect: instance should exists
        XCTAssertNotNil(controller);
        
        // Expect: viewController should has its dependencies set
        XCTAssertNotNil(controller?.presenter);
        XCTAssertTrue(controller === controller?.presenter.view);
        
    }
    
    func testCityListViewControllerDependencies() {
        
        // When: ask container to provide a CityListViewController
        let controller = container.resolve(CityListViewController.self);
        
        // Expect: instance should exist
        XCTAssertNotNil(controller);
        
        // Expect: viewController should has its dependencies set
        XCTAssertNotNil(controller?.presenter);
        XCTAssertTrue(controller === controller?.presenter.view);
    }
    
}
