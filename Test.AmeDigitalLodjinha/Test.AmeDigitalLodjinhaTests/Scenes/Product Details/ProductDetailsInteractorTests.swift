//
//  ProductDetailsInteractorTests.swift
//  Test.AmeDigitalLodjinhaTests
//
//  Created by Leandro Romano on 23/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import XCTest
import Cuckoo
import Nimble
import PromiseKit

@testable import Test_AmeDigitalLodjinha

class ProductDetailsInteractorTests: XCTestCase {

    var sut: ProductDetailsInteractor!
    var mockWorker: MockProductDetailsWorker!
    
    lazy var selectedProduct: ProductModel = {
        return ProductModel(
            id: 1, name: "GTA V", imageUrl: "a-valid-url", description: "a-valid-description", oldPrice: 199, currentPrice: 149,
            category: CategoryModel(id: 1, description: "Games", imageUrl: "a-valid-url"))
    }()
    
    override func setUp() {
        super.setUp()
        PromiseKit.conf.Q.map = nil
        PromiseKit.conf.Q.return = nil
        
        mockWorker = MockProductDetailsWorker()
        sut = ProductDetailsInteractor(worker: mockWorker)
        sut.product = selectedProduct
    }
    
    func testRequestProductDetailsSuccess() {
        let mockPresenter = MockProductDetailsPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentProductDetails(product: any())).thenDoNothing()
        }
        
        sut.presenter = mockPresenter
        sut.requestProductDetails()
        
        verify(mockPresenter, times(1)).presentProductDetails(product: any())
    }
    
    func testRequestProductReserveSuccess() {
        let mockPresenter = MockProductDetailsPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentLoadingStateForReserveRequest()).thenDoNothing()
            when(stub.presentSuccessReserveMessage()).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.requestReserveForProduct(id: any())).then { _ -> Promise<ProductDetails.Reserve.Response> in
                let response = ProductDetails.Reserve.Response(result: "success")
                return .value(response)
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestProductReserve()
        
        verify(mockPresenter, times(1)).presentLoadingStateForReserveRequest()
        verify(mockPresenter, times(1)).presentSuccessReserveMessage()
    }
    
    func testRequestProductReserveWithFailureResponse() {
        let mockPresenter = MockProductDetailsPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentLoadingStateForReserveRequest()).thenDoNothing()
            when(stub.presentErrorReserveMessage(any())).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.requestReserveForProduct(id: any())).then { _ -> Promise<ProductDetails.Reserve.Response> in
                let response = ProductDetails.Reserve.Response(result: "another-error-code")
                return .value(response)
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestProductReserve()
        
        verify(mockPresenter, times(1)).presentLoadingStateForReserveRequest()
        verify(mockPresenter, times(1)).presentErrorReserveMessage(any())
    }
    
    func testRequestProductReserveFailure() {
        let mockPresenter = MockProductDetailsPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentLoadingStateForReserveRequest()).thenDoNothing()
            when(stub.presentErrorReserveMessage(any())).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.requestReserveForProduct(id: any())).then { _ -> Promise<ProductDetails.Reserve.Response> in
                return Promise<ProductDetails.Reserve.Response> { seal in
                    seal.reject(NetworkError.mappingError)
                }
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestProductReserve()
        
        verify(mockPresenter, times(1)).presentLoadingStateForReserveRequest()
        verify(mockPresenter, times(1)).presentErrorReserveMessage(any())
    }

    override func tearDown() {
        super.tearDown()
        mockWorker = nil
        sut = nil
    }

}
