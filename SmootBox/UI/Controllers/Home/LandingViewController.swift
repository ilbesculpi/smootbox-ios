//
//  LandingViewController.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/1/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit
import Firebase

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    @IBAction func skipSignIn(_ sender: Any) {
        
    }
    
    private func firebaseAnonymousSignIn() {
        Auth.auth().signInAnonymously { (authResult, error) in
            
        }
    }
    

}
