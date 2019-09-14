//
//  LandingPresenter.swift
//  SmootBox
//
//  Presenter for Landing View
//

import UIKit

class LandingPresenter: NSObject {

    
    // MARK: - Properties
    weak var view: LandingViewController!
    
    
    // MARK: - Initialization
    init(view: LandingViewController) {
        self.view = view;
    }
    
    deinit {
        self.view = nil;
    }
    
    
}
