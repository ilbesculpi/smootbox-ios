//
//  City.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation

class City {
    
    var name: String = "";
    
    init() {
        
    }
    
    convenience init(name: String) {
        self.init();
        self.name = name;
    }
    
}
