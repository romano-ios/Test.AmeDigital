//
//  HomeRouter.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 14/06/19.
//  Copyright (c) 2019 Leandro Romano. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol HomeRoutingLogic {
    func routeToBestSellerDetails()
    func routeToProductsListByCategory()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {

    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    func routeToBestSellerDetails() {
        let productDetailsVC = ProductDetailsViewController(nibName: String(describing: ProductDetailsViewController.self), bundle: nil)
        guard let productDetailsRouter = productDetailsVC.router, var productDetailsDS = productDetailsRouter.dataStore else { return }
        
        if let dataStore = dataStore {
            passDataToProductDetails(source: dataStore, destination: &productDetailsDS)
            navigateTo(productDetailsVC, from: viewController)
        }
    }
    
    func passDataToProductDetails(source: HomeDataStore, destination: inout ProductDetailsDataStore) {
        destination.product = source.product
    }
    
    func routeToProductsListByCategory() {
        let productListVC = ProductListViewController(nibName: String(describing: ProductListViewController.self), bundle: nil)
        guard let productListRouter = productListVC.router, var productListDS = productListRouter.dataStore else { return }
        
        if let dataStore = dataStore {
            passDataToProductList(source: dataStore, destination: &productListDS)
            navigateTo(productListVC, from: viewController)
        }
    }
    
    func passDataToProductList(source: HomeDataStore, destination: inout ProductListDataStore) {
        destination.category = source.category
    }
    
    func navigateTo(_ destination: UIViewController, from source: HomeViewController?) {
        source?.navigationController?.pushViewController(destination, animated: true)
    }
    
}
