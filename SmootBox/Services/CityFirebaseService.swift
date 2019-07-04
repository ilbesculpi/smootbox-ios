//
//  CitiesService.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation
import Alamofire
import Promises
import FirebaseDatabase

enum ServiceError: Error {
    
    case invalidResponse
    case appError(message: String)
    
}

class CityFirebaseService: BaseFirebaseService, CityRepository {
    
    /**
     Fetch a list of cities from database.
    */
    func fetchCities(callback: @escaping (([City]) -> Void)) -> DatabaseHandle {
        
        let dbRef = ref.child("cities");
        
        return dbRef.observe(.value) { (snapshot) in
            let dict = snapshot.value as? [String : [String : AnyObject]] ?? [:];
            let cities: [City] = dict.reduce(into: [], { (result, data) in
                let city = City.from(json: data.value);
                city.key = data.key;
                result.append(city);
            });
            callback(cities);
        }
        
    }
    
}
