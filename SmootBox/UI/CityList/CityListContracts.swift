//
//  CityListContract.swift
//  SmootBox
//
//  Contracts for City List Screen.
//

import Foundation


protocol CityListViewContract: BaseViewContract {
    
    var presenter: CityListPresenterContract! { get set }
    
    func displayCities(_ cities: [City]);
    func displayEmptyListMessage();
    
}

protocol CityListPresenterContract: BasePresenterContract {
    
    var view: CityListViewContract! { get set }
    
    func refresh();
    
}
