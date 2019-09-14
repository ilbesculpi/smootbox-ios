//
//  UIStoryboard_Navigation.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/1/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    internal enum Scene {
        
        internal enum Home {
            
            static let storyboard = UIStoryboard(name: "Main", bundle: nil);
            
            static var landing : LandingViewController {
                return storyboard.instantiateViewController(withIdentifier: "Landing") as! LandingViewController;
            }
            
        }
        
        internal enum City {
            
            static let storyboard = UIStoryboard(name: "Main", bundle: nil);
            
            static var CityList : CityListViewController {
                return storyboard.instantiateViewController(withIdentifier: "CityList") as! CityListViewController;
            }
            
        }
        
    }
    
}
