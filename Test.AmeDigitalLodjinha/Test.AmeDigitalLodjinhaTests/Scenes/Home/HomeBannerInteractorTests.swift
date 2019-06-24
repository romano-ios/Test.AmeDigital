//
//  HomeBannerInteractorTests.swift
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

class HomeBannerInteractorTests: XCTestCase {
    
    var sut: HomeInteractor!
    var mockWorker: MockHomeWorker!

    override func setUp() {
        super.setUp()
        PromiseKit.conf.Q.map = nil
        PromiseKit.conf.Q.return = nil
        
        mockWorker = MockHomeWorker()
        sut = HomeInteractor(worker: mockWorker)
    }
    
    func testSetupBannersContentLoading() {
        let mockPresenter = MockHomePresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentBannersLoading()).thenDoNothing()
        }
        
        sut.presenter = mockPresenter
        sut.setupBannersContentLoading()
        
        verify(mockPresenter, times(1)).presentBannersLoading()
    }
    
    func testRequestBannersContentSuccess() {
        let mockPresenter = MockHomePresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentBanners(response: any())).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.getBanners()).then { _ -> Promise<Home.Banner.Response> in
                let banners = [BannerModel]()
                let response = Home.Banner.Response(data: banners)
                return .value(response)
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestBannersContent()
        
        verify(mockPresenter, times(1)).presentBanners(response: any())
    }
    
    func testRequestBannersContentFailure() {
        let mockPresenter = MockHomePresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentBannersError()).thenDoNothing()
        }
        
        stub(mockWorker) { stub in
            when(stub.getBanners()).then { _ -> Promise<Home.Banner.Response> in
                return Promise<Home.Banner.Response> { seal in
                    seal.reject(NetworkError.mappingError)
                }
            }
        }
        
        sut.presenter = mockPresenter
        sut.requestBannersContent()
        
        verify(mockPresenter, times(1)).presentBannersError()
    }

    override func tearDown() {
        super.tearDown()
        mockWorker = nil
        sut = nil
    }

}
