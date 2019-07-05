//
//  AppDelegate.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/1/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    // MARK: - Properties
    
    var window: UIWindow?
    
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
        
        // Override point for customization after application launch.
        configureAppearance();
        configureFirebase();
        
        // configure initial controller
        let rootController = Wireframe.landingController();
        
        window = UIWindow(frame: UIScreen.main.bounds);
        window?.rootViewController = rootController;
        window?.makeKeyAndVisible();
        
        return true;
    }
    
    
    // MARK: - Appearance
    
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
    
    func setRootController(_ controller: UIViewController) {
        self.window?.rootViewController = controller;
    }
    
}

