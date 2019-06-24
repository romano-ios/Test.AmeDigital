//
//  ProductListInteractorTests.swift
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

class ProductListInteractorTests: XCTestCase {

    var sut: ProductListInteractor!
    var mockWorker: MockProductListWorker!
    
    override func setUp() {
        super.setUp()
        PromiseKit.conf.Q.map = nil
        PromiseKit.conf.Q.return = nil
        
        mockWorker = MockProductListWorker()
        sut = ProductListInteractor(worker: mockWorker)
        sut.category = CategoryModel(id: 1, description: "Games", imageUrl: "a-valid-url")
    }
    
    func testSetupTitleWithCategoryName() {
        let mockPresenter = MockProductListPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentTitleWithCategory(name: any())).thenDoNothing()
        }
        
        sut.category = CategoryModel(id: 1, description: "Games", imageUrl: "a-valid-url")
        sut.presenter = mockPresenter
        sut.setupTitleWithCategoryName()
        
        verify(mockPresenter, times(1)).presentTitleWithCategory(name: any())
    }
    
    func testSetupLoadingState() {
        let mockPresenter = MockProductListPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentLoadingState()).thenDoNothing()
        }
        
        sut.presenter = mockPresenter
        sut.setupLoadingState()
        
        verify(mockPresenter, times(1)).presentLoadingState()
    }
    
    func testRequestProductsByCategorySuccessWithFilledState() {
        let mockPresenter = MockProductListPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentFilledState()).thenDoNothing()
            when(stub.presentDynamicData()).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.getProductsByCategory(id: any(), offset: any(), limit: any())).then { _ -> Promise<ProductList.Response> in
                let response = ProductList.Response(offset: 0, total: 50, data: self.generateFakeProducts())
                return .value(response)
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestProductsByCategory()
        
        verify(mockPresenter, times(1)).presentFilledState()
        verify(mockPresenter, times(1)).presentDynamicData()
    }
    
    func testRequestProductsByCategorySuccessWithEmptyState() {
        let mockPresenter = MockProductListPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentEmptyState()).thenDoNothing()
            when(stub.presentDynamicData()).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.getProductsByCategory(id: any(), offset: any(), limit: any())).then { _ -> Promise<ProductList.Response> in
                let response = ProductList.Response(offset: 0, total: 50, data: [])
                return .value(response)
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestProductsByCategory()
        
        verify(mockPresenter, times(1)).presentEmptyState()
        verify(mockPresenter, times(1)).presentDynamicData()
    }
    
    func testRequestProductsByCategoryFailure() {
        let mockPresenter = MockProductListPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentRequestError(any())).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.getProductsByCategory(id: any(), offset: any(), limit: any())).then { _ -> Promise<ProductList.Response> in
                return Promise<ProductList.Response> { seal in
                    seal.reject(NetworkError.mappingError)
                }
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestProductsByCategory()
        
        verify(mockPresenter, times(1)).presentRequestError(any())
    }
    
    func testCellForRow() {
        sut.products = generateFakeProducts()
        let viewModel = sut.cellForRow(at: 0)
        
        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.id, 1)
        XCTAssertEqual(viewModel.name, "GTA V")
    }
    
    func testDidSelect() {
        let mockPresenter = MockProductListPresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentProductDetails()).thenDoNothing()
        }
        
        sut.products = generateFakeProducts()
        sut.presenter = mockPresenter
        sut.didSelect(at: 0)
        
        XCTAssertNotNil(sut.product)
        XCTAssertEqual(sut.product?.id, 1)
        XCTAssertEqual(sut.product?.name, "GTA V")
        verify(mockPresenter, times(1)).presentProductDetails()
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
