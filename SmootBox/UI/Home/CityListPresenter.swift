//
//  CityListPresenter.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit

class CityListPresenter: CityListController {
    
    // MARK: - Properties
    
    let citiesService: CitiesService = CitiesService();
    var view: CityListView!

    
    // MARK: - Controller
    
    init(view: CityListView) {
        self.view = view;
    }
    
    func onStart() {
        view.startLoading();
        citiesService.fetchCities()
            .then { [weak view] (cities) in
                view?.stopLoading();
                view?.displayCities(cities);
            }
            .catch { [weak view] (error) in
                view?.stopLoading();
                view?.displayError(error.localizedDescription);
            }
    }
    
}
