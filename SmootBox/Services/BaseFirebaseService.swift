//
//  BaseFirebaseService.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 7/4/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation
import FirebaseDatabase

class BaseFirebaseService: BaseRepository {
    
    var authToken: String = "";
    
    var database: Database {
        get {
            return Database.database();
        }
    };
    
    var ref: DatabaseReference {
        get {
            return database.reference();
        }
    };
    
    func remove(handler: DatabaseHandle) {
        ref.removeObserver(withHandle: handler);
    }
    
}
