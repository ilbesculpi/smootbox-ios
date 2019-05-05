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

enum ServiceError: Error {
    
    case invalidResponse
    case appError(message: String)
    
}

class CitiesService {
    
    var authToken: String = "";
    
    func fetchCities() -> Promise<[City]> {
        
        let promise = Promise<[City]> { [unowned self] (fullfill, reject) in
            
            let url = "https://us-central1-smootbox.cloudfunctions.net/cities";
            
            let headers : HTTPHeaders = [
                "Content-Type": "application/json",
                "X-Auth-Token": self.authToken
            ];
            
            AF.request(url, method: .get, headers: headers)
                .responseJSON { (response) in
                    
                    if let error = response.error {
                        print("[ERROR] error in fetchCities(): \(error.localizedDescription)");
                        if let data = response.data {
                            do {
                                let root = try JSONSerialization.jsonObject(with: data, options: []);
                                if let dict = root as? [String : Any] {
                                    if let message = dict["message"] as? String {
                                        let appError = ServiceError.appError(message: message);
                                        reject(appError);
                                    }
                                }
                            }
                            catch {
                                print("[ERROR] error in fetchCities(): \(error.localizedDescription)");
                                reject(ServiceError.invalidResponse);
                            }
                        }
                        reject(ServiceError.invalidResponse);
                        return;
                    }
                    
                    guard let data = response.data else {
                        reject(ServiceError.invalidResponse);
                        return;
                    }
                    
                    var cities: [City] = [];
                    do {
                        let root = try JSONSerialization.jsonObject(with: data, options: []);
                        if let dict = root as? [String : Any] {
                            if let array = dict["cities"] as? [[String : Any]] {
                                for item in array {
                                    let city = City.from(json: item);
                                    cities.append(city);
                                }
                            }
                        }
                        fullfill(cities);
                    }
                    catch {
                        print("[ERROR] error in fetchCities(): \(error.localizedDescription)");
                        reject(ServiceError.invalidResponse);
                    }
                }
            
        }
        
        return promise;
        
    }
    
}
