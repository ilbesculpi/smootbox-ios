//
//  City.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation

class City {
    
    struct Picture {
        var original: String = "";
        var small: String = "";
        var medium: String = "";
    }
    
    var key: String = "";
    var name: String = "";
    var shortDescription: String = "";
    var picture: Picture?
    
    init() {
        
    }
    
    convenience init(name: String) {
        self.init();
        self.name = name;
    }
    
}

extension City {
    
    static func from(json: [String : AnyObject]) -> City {
        let city = City();
        city.name = json["name"] as? String ?? "";
        city.shortDescription = json["shortDescription"] as? String ?? "";
        if let picture = json["picture"] as? [String : AnyObject] {
            city.picture = Picture(
                original: picture["original"] as? String ?? "",
                small: picture["small"] as? String ?? "",
                medium: picture["medium"] as? String ?? ""
            );
        }
        return city;
    }
    
}
