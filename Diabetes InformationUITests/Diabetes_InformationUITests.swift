//
//  Diabetes_InformationUITests.swift
//  Diabetes InformationUITests
//
//  Created by Wesley Cates on 1/31/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import XCTest

class Diabetes_InformationUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func test_OpeningApp(){
        
        XCTAssert(app.staticTexts["Diabetes & You"].exists)
    }
    
    func test_MenuButtonsExist(){
        
        XCTAssert(app.buttons["Healthy Eating"].exists)
        XCTAssert(app.buttons["Exercise"].exists)
        XCTAssert(app.buttons["Insulin"].exists)
        XCTAssert(app.buttons["Blood Sugar"].exists)
        XCTAssert(app.buttons["Complications"].exists)
    }
    
    func test_HealthyEating_SubModuleButtonsExists() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        app.buttons["Healthy Eating"].tap()
        XCTAssert(app.buttons["General Tips"].exists)
        XCTAssert(app.buttons["Carb Counting"].exists)
    }
    
    func test_Complications_SubModuleButtonsExists() {
        
        app.buttons["Complications"].tap()
        XCTAssert(app.buttons["Preventing Complications"].exists)
        XCTAssert(app.buttons["Sick Days"].exists)
    }
    
    
    func test_Complications_PreventingComplicationsNavigation(){
        
        
      
        app.buttons["Complications"].tap()
        app.buttons["Preventing Complications"].tap()
        
        
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        
        XCTAssert(app.buttons["Main Menu"].exists)
        XCTAssert(app.buttons["To \"Sick Days\""].exists)
        
    }
    
    func test_Complications_PreventingComplicationsActivity_Eyes() {
        
       
        app.buttons["Complications"].tap()
        app.buttons["Preventing Complications"].tap()
        
        let window = app.childrenMatchingType(.Window).elementBoundByIndex(0)
        let element = window.childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element
        
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        
        let element2 = element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(2)

        element2.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Button).elementBoundByIndex(0).tap()
        XCTAssert(app.staticTexts["Eyes"].exists)
        window.childrenMatchingType(.Other).elementBoundByIndex(2).childrenMatchingType(.Other).elementBoundByIndex(2).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element.childrenMatchingType(.Button).element.tap()
        XCTAssertFalse(app.staticTexts["Eyes"].exists)
        
        
    }
    
    func test_Complications_PreventingComplicationsActivity_Skin() {
        
        
        app.buttons["Complications"].tap()
        app.buttons["Preventing Complications"].tap()
        
        let window = app.childrenMatchingType(.Window).elementBoundByIndex(0)
        let element = window.childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element
        
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        
        let element2 = element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(2)
        
        element2.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Button).elementBoundByIndex(2).tap()
        XCTAssert(app.staticTexts["Skin"].exists)
        window.childrenMatchingType(.Other).elementBoundByIndex(2).childrenMatchingType(.Other).elementBoundByIndex(2).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element.childrenMatchingType(.Button).element.tap()
        XCTAssertFalse(app.staticTexts["Skin"].exists)
        
        
    }
    
    func test_Complications_PreventingComplicationsActivity_Stomach() {
        
        
        app.buttons["Complications"].tap()
        app.buttons["Preventing Complications"].tap()
        
        let window = app.childrenMatchingType(.Window).elementBoundByIndex(0)
        let element = window.childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element
        
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        
        let element2 = element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(2)
        
        element2.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Button).elementBoundByIndex(1).tap()
        XCTAssert(app.staticTexts["Stomach"].exists)
        window.childrenMatchingType(.Other).elementBoundByIndex(2).childrenMatchingType(.Other).elementBoundByIndex(2).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element.childrenMatchingType(.Button).element.tap()
        XCTAssertFalse(app.staticTexts["Stomach"].exists)
        
        
    }
    
    func test_Complications_PreventingComplicationsActivity_Shoes() {
        
        
        app.buttons["Complications"].tap()
        app.buttons["Preventing Complications"].tap()
        
        let window = app.childrenMatchingType(.Window).elementBoundByIndex(0)
        let element = window.childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element
        
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        
        let element2 = element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(2)
        
        element2.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Button).elementBoundByIndex(4).tap()
        XCTAssert(app.staticTexts["Shoes"].exists)
        
        /*
        window.childrenMatchingType(.Other).elementBoundByIndex(2).childrenMatchingType(.Other).elementBoundByIndex(2).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element.childrenMatchingType(.Button).element.tap()
        XCTAssertFalse(app.staticTexts["Shoes"].exists)
        */
        
    }
    
    func test_Complications_PreventingComplicationsActivity_Feet() {
        
        
        app.buttons["Complications"].tap()
        app.buttons["Preventing Complications"].tap()
        
        let window = app.childrenMatchingType(.Window).elementBoundByIndex(0)
        let element = window.childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element
        
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        
        let element2 = element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(2)
        
        element2.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Button).elementBoundByIndex(3).tap()
        XCTAssert(app.staticTexts["Feet"].exists)
        /*
        window.childrenMatchingType(.Other).elementBoundByIndex(2).childrenMatchingType(.Other).elementBoundByIndex(2).childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).element.childrenMatchingType(.Button).element.tap()
        XCTAssertFalse(app.staticTexts["Feet"].exists)
    */
        
    
    }


    
    func test_Complications_SickDaysNavigation() {
        
        app.buttons["Complications"].tap()
        app.buttons["Sick Days"].tap()
        
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
        XCTAssert(app.buttons["Main Menu"].exists)
        XCTAssert(app.buttons["To \"Preventing Complications\""].exists)
    }
    
    
    
}
