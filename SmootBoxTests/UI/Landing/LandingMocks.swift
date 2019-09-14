//
//  LandingMocks.swift
//  SmootBoxTests
//
//  Mocks for Landing Screen.
//

import XCTest
import Firebase
@testable import SmootBox

class LandingMocks {

    class Presenter : LandingPresenter {
        
        var signInAnonuymousCalled: Bool = false;
        
        override func signInAnonymous(completion: ((Result<User, ServiceError>) -> Void)?) {
            signInAnonuymousCalled = true;
        }
        
    }

}
