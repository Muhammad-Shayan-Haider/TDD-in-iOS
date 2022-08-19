//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Muhammad Shayan on 18/08/2022.
//

import XCTest

class SignupFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let firstName = app.textFields["firstNameTextField"]
        let lastName = app.textFields["lastNameTextField"]
        let email = app.textFields["emailTextField"]
        let password = app.secureTextFields["passwordTextField"]
        let repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        let signupButton = app.buttons["signupButton"]
            
        XCTAssertTrue(firstName.isEnabled)
        XCTAssertTrue(lastName.isEnabled)
        XCTAssertTrue(email.isEnabled)
        XCTAssertTrue(password.isEnabled)
        XCTAssertTrue(repeatPassword.isEnabled)
        XCTAssertTrue(signupButton.isEnabled)
    }
    
    func testViewController_WhenInvalidFormSubmitted_PresentsErrorAlert() {
        // Given
        let app = XCUIApplication()
        app.launch()
        
        let firstName = app.textFields["firstNameTextField"]
        firstName.tap()
        firstName.typeText("S")
        
        let lastName = app.textFields["lastNameTextField"]
        lastName.tap()
        lastName.typeText("K")
        
        let email = app.textFields["emailTextField"]
        email.tap()
        email.typeText("@")
        
        let password = app.secureTextFields["passwordTextField"]
        password.tap()
        password.typeText("123456")
        
        let repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        let signupButton = app.buttons["signupButton"]
        
        // When
        signupButton.tap()
        
        // Then
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
