//
//  AppDelegate.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/1/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit
import Firebase
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    // MARK: - Properties
    
    var window: UIWindow?
    
    var container: Container = UIContainer.defaultContainer;
    
    private var _user: User?
    
    var loggedUser: User? {
        get {
            return _user;
        }
        set {
            _user = newValue;
        }
    };

    
    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Bootstrap app
        bootstrap();
        
        // configure initial controller
        let rootController = configureRootController();
        window = UIWindow(frame: UIScreen.main.bounds);
        window?.rootViewController = rootController;
        window?.makeKeyAndVisible();
        
        return true;
    }
    
    
    // MARK: - Bootstrap
    
    func bootstrap() {
        configureAppearance();
        configureFirebase();
    }
    
    private func configureAppearance() {
        UINavigationBar.appearance().barTintColor = UIColor.primaryDarkColor;
        UINavigationBar.appearance().tintColor = UIColor.white;
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ];
    }

    
    // MARK: - Dependencies
    
    private func configureFirebase() {
        FirebaseApp.configure();
    }

    
    // MARK: - UI Navigation
    
    func configureRootController() -> UIViewController {
        let controller = container.resolve(LandingViewController.self)!
        return controller;
    }
    
    func setRootController(_ controller: UIViewController) {
        self.window?.rootViewController = controller;
    }
    
}

