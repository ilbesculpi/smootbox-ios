//
//  CityListContract.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation


protocol CityListView: BaseView {
    
    func displayCities(_ cities: [City]);
    func displayEmptyListMessage();
    
}

protocol CityListController: BaseController {
    
    func refresh();
    
}
