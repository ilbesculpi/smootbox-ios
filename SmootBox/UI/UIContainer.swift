//
//  UIContainer.swift
//  SmootBox
//
//  UI Container for providing controller dependencies.
//

import UIKit
import Swinject


class UIContainer: NSObject {

    static let defaultContainer: Container = {
        
        let container = Container();
        
        registerViewControllers(container);
        
        return container;
    }();
    
    
    // MARK: - ViewControllers
    
    static func registerViewControllers(_ container: Container) {
        
        // Landing
        container.register(LandingViewController.self) { r in
            let controller = UIStoryboard.Scene.Home.landing;
            let presenter = LandingPresenter(view: controller);
            controller.presenter = presenter;
            return controller;
        }
        
        // CityList
        container.register(CityListViewController.self) { r in
            let controller = UIStoryboard.Scene.City.cityList;
            let presenter = CityListPresenter(view: controller);
            controller.presenter = presenter;
            return controller;
        }
        
    }
    
}
