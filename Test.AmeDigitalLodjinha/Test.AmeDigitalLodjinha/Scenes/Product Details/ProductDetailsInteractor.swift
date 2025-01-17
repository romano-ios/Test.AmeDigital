//
//  ProductDetailsInteractor.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 20/06/19.
//  Copyright (c) 2019 Leandro Romano. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol ProductDetailsBusinessLogic {
    func requestProductDetails()
    func requestProductReserve()
}

protocol ProductDetailsDataStore {
    var product: ProductModel? { get set }
}

class ProductDetailsInteractor: ProductDetailsBusinessLogic, ProductDetailsDataStore {

    var presenter: ProductDetailsPresentationLogic?
    var worker: ProductDetailsWorker?
    var product: ProductModel?
    
    init(worker: ProductDetailsWorker = ProductDetailsWorker()) {
        self.worker = worker
    }
    
    func requestProductDetails() {
        if let product = self.product {
            presenter?.presentProductDetails(product: product)
        }
    }
    
    func requestProductReserve() {
        if let product = product {
            presenter?.presentLoadingStateForReserveRequest()
            worker?.requestReserveForProduct(id: product.id).done(handleReserveSuccess).catch(handleReserveError)
        }
    }
    
    private func handleReserveSuccess(_ response: ProductDetails.Reserve.Response) {
        guard response.result == "success" else {
            presenter?.presentErrorReserveMessage(NetworkError.notFound)
            return
        }
        
        presenter?.presentSuccessReserveMessage()
    }
    
    private func handleReserveError(_ error: Error) {
        presenter?.presentErrorReserveMessage(error)
    }

}
