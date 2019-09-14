//
//  LandingViewController.swift
//  SmootBox
//
//  Landing View
//

import UIKit
import Firebase
import Promises

class LandingViewController: BaseViewController, LandingViewContract {
    
    
    // MARK: - Properties
    var presenter: LandingPresenterContract!
    
    
    // MARK: - IBOutlet
    @IBOutlet weak var buttonSkipSignIn: UIButton!
    @IBOutlet weak var buttonSignIn: UIButton!
    
    
    // MARK: - Initialization
    
    deinit {
        self.presenter = nil;
    }

    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    
    // MARK: - IBAction
    
    @IBAction func skipSignIn(_ sender: Any) {
        
        presenter.signInAnonymous() { [weak self] result in
            
            switch result {
                
                case .success(let user):
                    print("[INFO] Signed in successfully.");
                    self?.appDelegate.loggedUser = user;
                    self?.navigateToHome();
                
                case .failure(let error):
                    print("[ERROR] Could not sign in anonymously: \(error.localizedDescription)");
                    self?.displayError("Error signing in.");
            }
            
        }
        
    }
    
    
    private func navigateToHome() {
        let homeController = appDelegate.container.resolve(CityListViewController.self)!
        let rootController = UINavigationController(rootViewController: homeController);
        appDelegate.setRootController(rootController);
    }
    

}
