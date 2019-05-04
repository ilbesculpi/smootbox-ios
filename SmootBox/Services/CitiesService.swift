//
//  CitiesService.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation
import Promises

class CitiesService {
    
    func fetchCities() -> Promise<[City]> {
        
        let promise = Promise<[City]>.pending();
        
        
        promise.fulfill([
            City(name: "New York"),
            City(name: "Las Vegas"),
            City(name: "Madrid"),
            City(name: "Paris")
            ]);
        
        return promise;
        
    }
    
}
