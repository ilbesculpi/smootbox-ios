//
//  CitiesService.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 7/4/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol CityRepository: BaseRepository {
    
    func fetchCities(callback: @escaping (([City]) -> Void)) -> DatabaseHandle
    
}
