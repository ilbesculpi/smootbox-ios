//
//  UIImageView_Extension.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/19/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadUrl(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
                DispatchQueue.main.async() {
                    self.image = image;
                }
            }.resume();
    }
    
    func loadUrl(string: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: string) else {
            return;
        }
        loadUrl(url: url, contentMode: mode);
    }
    
    func loadUrl(_ s: String, placeholder: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        image = UIImage(named: placeholder);
        guard let url = URL(string: s) else {
            return;
        }
        loadUrl(url: url, contentMode: mode);
    }
    
}
