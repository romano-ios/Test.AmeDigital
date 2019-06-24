//
//  HomeCategoriesInteractorTests.swift
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

class HomeCategoriesInteractorTests: XCTestCase {

    var sut: HomeInteractor!
    var mockWorker: MockHomeWorker!
    
    override func setUp() {
        super.setUp()
        PromiseKit.conf.Q.map = nil
        PromiseKit.conf.Q.return = nil
        
        mockWorker = MockHomeWorker()
        sut = HomeInteractor(worker: mockWorker)
    }
    
    func testRequestCategoriesSuccess() {
        let mockPresenter = MockHomePresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentDynamicData()).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.getCategories()).then { _ -> Promise<Home.Category.Response> in
                let categories = [CategoryModel]()
                let response = Home.Category.Response(data: categories)
                return .value(response)
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestCategories()
        
        verify(mockPresenter, times(1)).presentDynamicData()
    }
    
    func testRequestCategoriesFailure() {
        let mockPresenter = MockHomePresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentGenericError(errorMessage: any())).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.getCategories()).then { _ -> Promise<Home.Category.Response> in
                return Promise { seal in
                    seal.reject(NetworkError.mappingError)
                }
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestCategories()
        
        verify(mockPresenter, times(1)).presentGenericError(errorMessage: any())
    }
    
    func testCellForCategories() {
        sut.categories = generateFakeCategories()
        let viewModels = sut.cellForCategories()
        
        XCTAssertNotNil(sut.categories)
        XCTAssertNotNil(viewModels)
        XCTAssertEqual(sut.categories.count, 3)
        XCTAssertEqual(sut.categories.count, viewModels.count)
    }
    
    func testDidSelectCategory() {
        let mockPresenter = MockHomePresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentProductsListByCategory()).thenDoNothing()
        }
        
        sut.presenter = mockPresenter
        sut.categories = generateFakeCategories()
        sut.didSelectCategory(at: 0)
        
        XCTAssertNotNil(sut.category)
        XCTAssertEqual(sut.category?.id, 1)
        XCTAssertEqual(sut.category?.description, "Games")
        verify(mockPresenter, times(1)).presentProductsListByCategory()
    }
    
    private func generateFakeCategories() -> [CategoryModel] {
        var categories = [CategoryModel]()
        categories.append(CategoryModel(id: 1, description: "Games", imageUrl: "a-valid-url"))
        categories.append(CategoryModel(id: 2, description: "Filmes", imageUrl: "a-valid-url"))
        categories.append(CategoryModel(id: 3, description: "Eletronicos", imageUrl: "a-valid-url"))
        return categories
    }

    override func tearDown() {
        super.tearDown()
        mockWorker = nil
        sut = nil
    }

}
