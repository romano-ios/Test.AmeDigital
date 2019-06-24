//
//  HomeInteractorTests.swift
//  Test.AmeDigitalLodjinhaTests
//
//  Created by Leandro Romano on 23/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import XCTest
import Cuckoo
import Nimble

@testable import Test_AmeDigitalLodjinha

class HomeInteractorTests: XCTestCase {

    var sut: HomeInteractor!
    
    override func setUp() {
        super.setUp()
        sut = HomeInteractor()
    }
    
    func testSetupNavigationLogo() {
        let mockPresenter = MockHomePresenter()
        
        stub(mockPresenter) { stub in
            when(stub.presentNavigationLogo()).thenDoNothing()
        }
        
        sut.presenter = mockPresenter
        sut.setupNavigationLogoView()
        
        verify(mockPresenter, times(1)).presentNavigationLogo()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

}
