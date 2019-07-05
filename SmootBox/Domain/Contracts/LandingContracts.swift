//
//  LandingContracts.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 7/5/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation

protocol LandingView: BaseView {
    
    func displayCities(_ cities: [City]);
    func displayEmptyListMessage();
    
}

protocol LandingController: BaseController {
    
    func refresh();
    
}
