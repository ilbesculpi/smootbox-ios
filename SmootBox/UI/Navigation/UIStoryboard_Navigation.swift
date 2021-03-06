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
            
            static var Home : UIViewController {
                return storyboard.instantiateViewController(withIdentifier: "Home");
            }
            
            static var CityListNav : UINavigationController {
                return storyboard.instantiateViewController(withIdentifier: "CityListNav") as! UINavigationController;
            }
            
            static var CityList : CityListController {
                return storyboard.instantiateViewController(withIdentifier: "CityList") as! CityListController;
            }
            
        }
        
    }
    
}
