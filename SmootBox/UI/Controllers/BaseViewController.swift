//
//  BaseViewController.swift
//  SmootBox
//
//  Base View Controller
//

import UIKit
import Firebase

class BaseViewController: UIViewController, BaseViewContract {

    
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
    
    
    // MARK: - BaseViewContract
    
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
