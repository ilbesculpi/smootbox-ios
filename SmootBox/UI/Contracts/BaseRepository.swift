//
//  BaseRepository.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 7/4/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol BaseRepository {
    
    var authToken: String { get set };
    
    func remove(handler: DatabaseHandle);
    
}
