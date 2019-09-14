//
//  LandingPresenter.swift
//  SmootBox
//
//  Presenter for Landing View
//

import UIKit
import Firebase
import Promises

class LandingPresenter : LandingPresenterContract {

    
    // MARK: - Properties
    weak var view: LandingViewContract!
    
    
    // MARK: - Initialization
    
    init(view: LandingViewContract) {
        self.view = view;
    }
    
    deinit {
        self.view = nil;
    }
    
    
    // MARK: - Sign In
    
    func signInAnonymous(completion: ((Result<User, ServiceError>) -> Void)?) {
        
        Auth.auth().signInAnonymously { (authResult, error) in
            
            if let error = error {
                let serviceError = ServiceError.appError(message: error.localizedDescription);
                let result = Result<User, ServiceError>.failure(serviceError);
                completion?(result);
                return;
            }
            
            guard let user = authResult?.user else {
                let error = ServiceError.invalidResponse;
                let result = Result<User, ServiceError>.failure(error);
                completion?(result);
                return;
            }
            
            let result = Result<User, ServiceError>.success(user);
            completion?(result);
        }
        
    }
    
}
