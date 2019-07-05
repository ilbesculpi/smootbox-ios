//
//  CityListViewController.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit

class CityListViewController: BaseViewController {

    
    // MARK: - Properties
    
    var presenter: CityListController!
    
    /**
    Hold the cities to display
    */
    var cities: [City] = [];
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var listView: UICollectionView!
    @IBOutlet weak var emptyMessageView: UIView!
    
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad();
        presenter.onStart();
    }
    
    // MARK: - IBAction
    
    @IBAction func reload(_ sender: UIButton) {
        presenter.refresh();
    }
    
}

// MARK: - CityListView
extension CityListViewController: CityListView {
    
    func displayCities(_ cities: [City]) {
        emptyMessageView.isHidden = true;
        self.cities = cities;
        self.listView.reloadData();
    }
    
    func displayEmptyListMessage() {
        listView.isHidden = true;
        emptyMessageView.isHidden = false;
    }

}

// MARK: -
extension CityListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let city = cities[indexPath.row];
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityListCell", for: indexPath) as! CityListCell;
        
        cell.display(city: city);
        
        return cell;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let w = (collectionView.frame.size.width - 16.0) / 2.0;
        let h = w * 9.0 / 16.0;
        return CGSize(width: w, height: h);
    }
    
    
}
