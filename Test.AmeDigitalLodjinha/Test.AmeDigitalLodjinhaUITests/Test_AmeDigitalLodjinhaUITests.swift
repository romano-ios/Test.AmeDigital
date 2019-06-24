//
//  Test_AmeDigitalLodjinhaUITests.swift
//  Test.AmeDigitalLodjinhaUITests
//
//  Created by Leandro Romano on 14/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import XCTest

class Test_AmeDigitalLodjinhaUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testReserveFirstBookProduct() {
        let app = XCUIApplication()
        sleep(2)
        app.tables.cells.firstMatch.tap()
        
        let book = app.tables.staticTexts["HTML e CSS"]
        if book.waitForExistence(timeout: 5) {
            XCTAssertTrue(book.exists)
            book.tap()
        }
        
        let reserveButton = app.buttons["Reservar"]
        if reserveButton.waitForExistence(timeout: 5) {
            XCTAssertTrue(reserveButton.exists)
            reserveButton.tap()
            
            sleep(2)
            
            let successMessage = app.alerts["Sucesso!"]
            XCTAssertTrue(successMessage.exists)
            successMessage.buttons["Fechar"].tap()
            
            sleep(2)
            
            let goBackToListAfterReserve = app.navigationBars["Livros"]
            XCTAssertTrue(goBackToListAfterReserve.exists)
        }
    }
    
    func testReserveFirstProductFromBestSellersList() {
        let app = XCUIApplication()
        sleep(2)
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Fifa 17"]/*[[".cells.staticTexts[\"Fifa 17\"]",".staticTexts[\"Fifa 17\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let reserveButton = app.buttons["Reservar"]
        if reserveButton.waitForExistence(timeout: 5) {
            XCTAssertTrue(reserveButton.exists)
            reserveButton.tap()
            
            sleep(2)
            
            let successMessage = app.alerts["Sucesso!"]
            XCTAssertTrue(successMessage.exists)
            successMessage.buttons["Fechar"].tap()
            
            sleep(2)
            
            let goBackToHomeAfterReserve = app.navigationBars["Home"]
            XCTAssertTrue(goBackToHomeAfterReserve.exists)
        }
    }
    
    func testCheckIfTabBarIsHiddenOnOtherViews() {
        let app = XCUIApplication()
        sleep(2)
        
        let tabBarHomeButton = app.tabBars.buttons["Home"]
        XCTAssertTrue(tabBarHomeButton.exists)
        
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Fifa 17"]/*[[".cells.staticTexts[\"Fifa 17\"]",".staticTexts[\"Fifa 17\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(1)
        
        XCTAssertFalse(tabBarHomeButton.exists)
        app.navigationBars["Games"].buttons["Home"].tap()
        
        XCTAssertTrue(tabBarHomeButton.exists)
    }

    func testAboutView() {
        let app = XCUIApplication()
        let aboutTabBar = app.tabBars.buttons["Sobre"]
        XCTAssertTrue(aboutTabBar.exists)
        aboutTabBar.tap()
        
        let aboutNavigation = app.navigationBars["Sobre"]
        XCTAssertTrue(aboutNavigation.exists)
        
        let nameApp = app.staticTexts["a Lodjinha"]
        XCTAssertTrue(nameApp.exists)
        
        let developerName = app.staticTexts["Leandro Romano"]
        XCTAssertTrue(developerName.exists)
    }

}
