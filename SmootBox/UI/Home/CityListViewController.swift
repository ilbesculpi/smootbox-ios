//
//  CityListViewController.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 5/3/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit

class CityListViewController: BaseViewController, CityListView {

    
    // MARK: - Properties
    
    var presenter: CityListController!
    
    /**
    Hold the cities to display
    */
    var cities: [City] = [];
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var listView: UICollectionView!
    
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad();
        presenter = CityListPresenter(view: self);
        presenter.onStart();
1    }
    
    
    // MARK: - CityListView
    
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    func displayError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert);
        present(alert, animated: false, completion: nil);
    }
    
    func displayCities(_ cities: [City]) {
        self.cities = cities;
        self.listView.reloadData();
    }
    

}

extension CityListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
        
        let w = (collectionView.frame.size.width - 8.0) / 2.0;
        let h = w * 16.0 / 9.0;
        return CGSize(width: w, height: h);
    }
    
    
}
