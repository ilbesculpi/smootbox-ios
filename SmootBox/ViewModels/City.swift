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
    var imageUrl: String = "";
    
    init() {
        
    }
    
    convenience init(name: String) {
        self.init();
        self.name = name;
    }
    
}

extension City {
    
    static func from(json: [String : Any]) -> City {
        let city = City();
        if let name = json["name"] as? String {
            city.name = name;
        }
        if let image = json["image"] as? String {
            city.imageUrl = image;
        }
        return city;
    }
    
}
