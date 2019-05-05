//
//  CityListContract.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation

protocol CityListView: class {
    
    func displayCities(_ cities: [City]);
    func displayEmptyListMessage();
    func startLoading();
    func stopLoading();
    func displayError(_ message: String);
    
}

protocol CityListController {
    
    func onStart();
    
}
