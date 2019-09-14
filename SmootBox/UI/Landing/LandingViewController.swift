//
//  LandingViewController.swift
//  SmootBox
//
//  Landing View
//

import UIKit
import Firebase
import Promises

class LandingViewController: BaseViewController {
    
    
    // MARK: - Properties
    var presenter: LandingPresenter!
    
    
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
        firebaseAnonymousSignIn()
            .then { [weak self] (user) in
                print("[INFO] Signed in successfully.");
                self?.appDelegate.loggedUser = user;
                self?.navigateToHome();
            }
            .catch { (error) in
                print("[ERROR] Could not sign in anonymously: \(error.localizedDescription)");
            }
    }
    
    private func firebaseAnonymousSignIn() -> Promise<User> {
        
        let promise = Promise<User>(on: .main) { fulfill, reject in
            Auth.auth().signInAnonymously { (authResult, error) in
                
                if let error = error {
                    reject(error);
                    return;
                }
                
                guard let user = authResult?.user else {
                    let error = AppError.signInError;
                    reject(error);
                    return;
                }
                
                fulfill(user);
            }
        };
        
        return promise;
        
    }
    
    private func navigateToHome() {
        let homeController = Wireframe.cityListController();
        let rootController = Wireframe.embedInNavigation(homeController);
        appDelegate.setRootController(rootController);
    }
    

}
