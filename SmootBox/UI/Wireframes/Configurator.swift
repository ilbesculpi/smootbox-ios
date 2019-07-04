//
//  Configurator.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 7/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation

class Configurator {
    
    static func configure(_ view: CityListViewController) {
        let presenter = CityListPresenter(view: view);
        presenter.cityService = CityFirebaseService();
        view.presenter = presenter;
    }
    
}
