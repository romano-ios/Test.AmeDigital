//
//  HomeBestSellerInteractorTests.swift
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

class HomeBestSellerInteractorTests: XCTestCase {

    var sut: HomeInteractor!
    var mockWorker: MockHomeWorker!
    
    override func setUp() {
        super.setUp()
        PromiseKit.conf.Q.map = nil
        PromiseKit.conf.Q.return = nil
        
        mockWorker = MockHomeWorker()
        sut = HomeInteractor(worker: mockWorker)
    }
    
    func testGetBestSellersSuccess() {
        let mockPresenter = MockHomePresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentDynamicData()).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.getBestSellers()).then { _ -> Promise<Home.BestSeller.Response> in
                let products = [ProductModel]()
                let response = Home.BestSeller.Response(data: products)
                return .value(response)
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestBestSellers()
        
        verify(mockPresenter, times(1)).presentDynamicData()
    }
    
    func testGetBestSellersFailure() {
        let mockPresenter = MockHomePresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentGenericError(errorMessage: any())).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.getBestSellers()).then { _ -> Promise<Home.BestSeller.Response> in
                return Promise { seal in
                    seal.reject(NetworkError.mappingError)
                }
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestBestSellers()
        
        verify(mockPresenter, times(1)).presentGenericError(errorMessage: any())
    }
    
    func testCellForBestSellerRow() {
        sut.bestSellers = generateFakeProducts()
        let viewModel = sut.cellForBestSellerRow(at: 0)
        
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.id, 1)
        XCTAssertEqual(viewModel.name, "GTA V")
    }
    
    func testDidSelectBestSeller() {
        let mockPresenter = MockHomePresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentBestSellerDetails()).thenDoNothing()
        }
        
        sut.bestSellers = generateFakeProducts()
        sut.presenter = mockPresenter
        sut.didSelectBestSeller(at: 0)
        
        XCTAssertNotNil(sut.product)
        XCTAssertNotNil(sut.product?.category)
        XCTAssertEqual(sut.product?.id, 1)
        XCTAssertEqual(sut.product?.name, "GTA V")
        XCTAssertEqual(sut.product?.category.id, 1)
        XCTAssertEqual(sut.product?.category.description, "Games")
        verify(mockPresenter, times(1)).presentBestSellerDetails()
    }
    
    func testNumberOfRows() {
        let products = generateFakeProducts()
        sut.bestSellers = products
        XCTAssertNotNil(sut.bestSellers)
        XCTAssertEqual(sut.bestSellers.count, products.count)
    }
    
    private func generateFakeProducts() -> [ProductModel] {
        let gamesCategory = CategoryModel(id: 1, description: "Games", imageUrl: "a-valid-url")
        
        var products = [ProductModel]()
        products.append(ProductModel(id: 1, name: "GTA V", imageUrl: "a-valid-url", description: "a-valid-description", oldPrice: 199, currentPrice: 99, category: gamesCategory))
        products.append(ProductModel(id: 2, name: "FIFA 19", imageUrl: "a-valid-url", description: "a-valid-description", oldPrice: 149, currentPrice: 99, category: gamesCategory))
        products.append(ProductModel(id: 3, name: "The Last Of Us Part II", imageUrl: "a-valid-url", description: "a-valid-description", oldPrice: 299, currentPrice: 189, category: gamesCategory))
        return products
    }

    override func tearDown() {
        super.tearDown()
        mockWorker = nil
        sut = nil
    }

}
