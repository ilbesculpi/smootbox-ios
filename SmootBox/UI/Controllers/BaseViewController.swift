//
//  BaseViewController.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/1/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit
import Firebase

class BaseViewController: UIViewController, BaseView {

    
    // MARK: - Properties
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate;
    };
    
    var loggedUser: User? {
        return appDelegate.loggedUser;
    }
    
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    
    // MARK: - BaseView
    
    func startLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true;
    }
    
    func stopLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false;
    }
    
    func displayError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil));
        present(alert, animated: false, completion: nil);
    }
    
    func displaySuccess(_ message: String) {
        let alert = UIAlertController(title: "Success!", message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil));
        present(alert, animated: false, completion: nil);
    }

}
