//
//  ProductDetailsPresenter.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 20/06/19.
//  Copyright (c) 2019 Leandro Romano. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol ProductDetailsPresentationLogic {
    func presentProductDetails(product: ProductModel)
    func presentLoadingStateForReserveRequest()
    func presentSuccessReserveMessage()
    func presentErrorReserveMessage(_ error: Error)
}

class ProductDetailsPresenter: ProductDetailsPresentationLogic {

    weak var viewController: ProductDetailsDisplayLogic?
    
    func presentProductDetails(product: ProductModel) {
        viewController?.displayProductDetails(viewModel: ProductDetails.ViewModel(product: product))
        viewController?.displayReserveProductButton()
    }
    
    func presentLoadingStateForReserveRequest() {
        viewController?.disableReserveProductButton()
    }
    
    func presentSuccessReserveMessage() {
        viewController?.disableReserveProductButton()
        viewController?.displaySuccessReserveMessage()
    }
    
    func presentErrorReserveMessage(_ error: Error) {
        viewController?.enableReserveProductButton()
        viewController?.displayErrorReserveMessage(errorMessage: error.localizedDescription)
    }
    
}
