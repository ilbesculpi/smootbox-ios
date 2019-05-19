//
//  UIImageView_Extension.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/19/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit

extension UIImageView {
    
    public func loadUrl(_ urlString: String) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let imageData = data {
                    self.image = UIImage(data: imageData);
                }
            }
        }
    }
    
    public func loadUrl(_ urlString: String, placeholder: String) {
        
        self.image = UIImage(named: placeholder);
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let imageData = data {
                    self.image = UIImage(data: imageData);
                }
            }
        }
    }
    
}
