//
//  LandingViewControllerTests.swift
//  SmootBoxTests
//
//  LandingViewController Unit Tests.
//

import XCTest
@testable import SmootBox

class LandingViewControllerTests: XCTestCase {
    
    
    // MARK: - Properties
    var controller: LandingViewController!
    var presenterMock: LandingMocks.Presenter!
    

    // MARK: - setUp & tearDown
    
    override func setUp() {
        controller = UIStoryboard.Scene.Home.landing;
        presenterMock = LandingMocks.Presenter(view: controller);
        controller.presenter = presenterMock;
    }

    override func tearDown() {
        controller = nil;
        presenterMock = nil;
    }
    
    
    // MARK: - View Configuration
    
    func testOutlets() {
        
        // When: view is loaded
        let _ = controller.view;
        
        // Expect: Outlets to be wired
        XCTAssertNotNil(controller.buttonSkipSignIn);
        XCTAssertNotNil(controller.buttonSignIn);
        
    }
    
    // MARK: - Sign In

    func testSignInAnonymous() {
        
        // When: view is loaded
        let _ = controller.view;
        
        // Then: tap signInAnonymous
        controller.buttonSkipSignIn.sendActions(for: .touchUpInside);
        
        // Expect: view should ask presenter to sign in anonymously
        XCTAssertTrue(presenterMock.signInAnonuymousCalled);
        
    }

}
