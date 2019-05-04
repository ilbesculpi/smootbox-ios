//
//  CityListCell.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit

class CityListCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelCityName: UILabel!
    
    override func awakeFromNib() {
        
    }
    
    func display(city: City) {
        image.image = UIImage(named: "CityPlaceholder");
        labelCityName.text = city.name;
    }
    
}
