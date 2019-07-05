//
//  String_Extension.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 7/5/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import Foundation

extension String {
    
    func substring(_ from: Int) -> String {
        let index = self.index(self.endIndex, offsetBy: from - self.count);
        return String(self[index...]);
    }
    
}
