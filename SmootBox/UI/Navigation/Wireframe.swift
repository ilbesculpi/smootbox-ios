//
//  Configurator.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 7/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation
import UIKit

class Wireframe {
    
    static func embedInNavigation(_ root: UIViewController) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: root);
        return navigation;
    }
    
    static func landingController() -> LandingViewController {
        let view = UIStoryboard.Scene.Home.landing;
        return view;
    }
    
    static func cityListController() -> CityListViewController {
        let view = UIStoryboard.Scene.City.CityList;
        let presenter = CityListPresenter(view: view);
        presenter.cityService = CityFirebaseService();
        view.presenter = presenter;
        return view;
    }
    
}
