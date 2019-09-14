//
//  AppContracts.swift
//  SmootBox
//
//  Base Contracts
//

import Foundation

protocol BaseViewContract : class {
    
    func startLoading();
    func stopLoading();
    func displayError(_ message: String);
    func displaySuccess(_ message: String);
    
}

protocol BasePresenterContract {
    
    func onViewReady();
    
}
