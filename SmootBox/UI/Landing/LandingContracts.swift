//
//  LandingContracts.swift
//  SmootBox
//
//  Contracts for Landing Screen
//

import Foundation
import Firebase

protocol LandingViewContract : class {
    
    var presenter: LandingPresenterContract! { get set }
    
}

protocol LandingPresenterContract : class {
    
    var view: LandingViewContract! { get set }
    
    func signInAnonymous(completion: ((Result<User, ServiceError>) -> Void)?)
    
}

protocol LandingRouterContract : class {
    
    func navigateToHomeScreen()
    
}
