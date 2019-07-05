//
//  CityListPresenter.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit
import Firebase

class CityListPresenter: CityListController {
    
    // MARK: - Properties
    
    var cityService: CityRepository!
    var view: CityListView!
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate;
    };
    
    var loggedUser: User? {
        return appDelegate.loggedUser;
    };
    
    var databaseHandler: DatabaseHandle!

    
    // MARK: - Controller
    
    init(view: CityListView) {
        self.view = view;
    }
    
    deinit {
        if let handler = self.databaseHandler {
            cityService.remove(handler: handler);
        }
    }
    
    func onStart() {
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
