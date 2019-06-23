//
//  HomeViewController+DisplayLogic.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 23/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation
import UIKit

protocol HomeDisplayLogic: class {
    func displayNavigationLogo()
    func displayBannersLoading()
    func displayBanners(viewModel: Home.Banner.ViewModel)
    func displayBannersError()
    func displayDynamicData()
    func displayGenericError(errorMessage: String)
    func displayBestSellerDetails()
    func displayProductsListByCategory()
}

extension HomeViewController: HomeDisplayLogic {
    
    func displayNavigationLogo() {
        self.navigationItem.title = R.string.home.navigation_title()
        self.navigationItem.titleView = UIImageView(image: R.image.logoNavbar())
    }
    
    func displayDynamicData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displayGenericError(errorMessage: String) {
        let alert = UIAlertController(title: R.string.home.error_title(), message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: R.string.home.error_close(), style: .default))
        present(alert, animated: true)
    }
    
    func displayBestSellerDetails() {
        router?.routeToBestSellerDetails()
    }
    
    func displayProductsListByCategory() {
        router?.routeToProductsListByCategory()
    }
    
}
