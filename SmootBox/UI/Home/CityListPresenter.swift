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
    
    let citiesService: CitiesService = CitiesService();
    var view: CityListView!
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate;
    };
    
    var loggedUser: User? {
        return appDelegate.loggedUser;
    };

    
    // MARK: - Controller
    
    init(view: CityListView) {
        self.view = view;
    }
    
    func onStart() {
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
            
            self.citiesService.authToken = authToken;
            self.citiesService.fetchCities()
                .then { [weak view = self.view] (cities) in
                    view?.stopLoading();
                    view?.displayCities(cities);
                }
                .catch { [weak self] (error) in
                    self?.handleError(error: error);
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
