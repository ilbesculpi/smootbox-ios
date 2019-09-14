//
//  CityListPresenter.swift
//  SmootBox
//
//  Presenter for City List Screen.
//

import UIKit
import Firebase

class CityListPresenter: CityListPresenterContract {
    
    
    // MARK: - Properties
    var cityService: CityRepository!
    weak var view: CityListViewContract!
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate;
    };
    
    var loggedUser: User? {
        return appDelegate.loggedUser;
    };
    
    var databaseHandler: DatabaseHandle!

    
    // MARK: - Initialization
    
    init(view: CityListViewContract) {
        self.view = view;
    }
    
    deinit {
        self.view = nil;
        if let handler = self.databaseHandler {
            cityService.remove(handler: handler);
        }
    }
    
    
    // MARK: - CityListPresenterContract
    
    func onViewReady() {
        fetchCities();
    }
    
    func refresh() {
        fetchCities();
    }
    
    func fetchCities() {
        
        view.startLoading();
        
        loggedUser?.getIDTokenForcingRefresh(true) { [unowned self] (token, error) in
            
            if let error = error {
                // Handle error
                self.handleError(error: error);
                return;
            }
            
            guard let authToken = token else {
                // Handle error
                return;
            }
            
            self.cityService.authToken = authToken;
            
            self.databaseHandler = self.cityService.fetchCities() { [weak view = self.view] (cities) in
                view?.stopLoading();
                view?.displayCities(cities);
            }
            
        }
        
    }
    
    func handleError(error: Error) {
        print("[ERROR] Error fetching cities: \(error.localizedDescription)");
        view.stopLoading();
        view.displayError("Error fetching cities.");
        view.displayEmptyListMessage();
    }
    
}
