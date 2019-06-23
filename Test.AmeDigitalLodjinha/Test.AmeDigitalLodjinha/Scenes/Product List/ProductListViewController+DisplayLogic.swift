//
//  ProductListViewController+DisplayLogic.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 22/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation
import UIKit

protocol ProductListDisplayLogic: class {
    func displayTitleWithCategory(name categoryName: String)
    func displayLoadingState()
    func displayEmptyState()
    func displayFilledState()
    func displayDynamicData()
    func displayRequestError(message: String)
    func displayProductDetails()
}

extension ProductListViewController: ProductListDisplayLogic {
    
    func displayTitleWithCategory(name categoryName: String) {
        title = categoryName
    }
    
    func displayLoadingState() {
        let loadingStateLabel = ProductBackgroundLabel()
        loadingStateLabel.text = R.string.productList.loading_message()
        productsTableView.backgroundView = loadingStateLabel
    }
    
    func displayEmptyState() {
        let emptyStateLabel = ProductBackgroundLabel()
        emptyStateLabel.text = R.string.productList.empty_message()
        productsTableView.backgroundView = emptyStateLabel
    }
    
    func displayFilledState() {
        productsTableView.backgroundView = nil
    }
    
    func displayDynamicData() {
        DispatchQueue.main.async {
            self.productsTableView.reloadData()
        }
    }
    
    func displayRequestError(message: String) {
        let alert = UIAlertController(
            title: R.string.productList.error_title(),
            message: R.string.productList.error_message(),
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: R.string.productList.error_close_message(), style: .default, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        present(alert, animated: true)
    }
    
    func displayProductDetails() {
        router?.routeToProductDetails()
    }
    
}
