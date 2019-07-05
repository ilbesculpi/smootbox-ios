//
//  AppContracts.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 7/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation

protocol BaseView: class {
    
    func startLoading();
    func stopLoading();
    func displayError(_ message: String);
    func displaySuccess(_ message: String);
    
}

protocol BaseController {
    
    func onStart();
    
}
