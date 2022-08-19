//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Muhammad Shayan on 18/08/2022.
//

import XCTest

class SignupFlowUITests: XCTestCase {

    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()

        firstName = app.textFields["firstNameTextField"]
        lastName = app.textFields["lastNameTextField"]
        email = app.textFields["emailTextField"]
        password = app.secureTextFields["passwordTextField"]
        repeatPassword = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
    }

    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        
        // Then
        XCTAssertTrue(firstName.isEnabled)
        XCTAssertTrue(lastName.isEnabled)
        XCTAssertTrue(email.isEnabled)
        XCTAssertTrue(password.isEnabled)
        XCTAssertTrue(repeatPassword.isEnabled)
        XCTAssertTrue(signupButton.isEnabled)
    }
    
    func testViewController_WhenInvalidFormSubmitted_PresentsErrorAlert() {
        // Given
        firstName.tap()
        firstName.typeText("S")
        
        lastName.tap()
        lastName.typeText("K")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("123456")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        // When
        signupButton.tap()
        
        // Then
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1))
    }
    
    func testViewController_WhenValidFormSubmitted_PresentsSuccessAlert() {
        // Given
        firstName.tap()
        firstName.typeText("Sergey")
        
        lastName.tap()
        lastName.typeText("Kargalov")
        
        email.tap()
        email.typeText("test@test.com")
        
        password.tap()
        password.typeText("Signs12345678")
        
        repeatPassword.tap()
        repeatPassword.typeText("Signs12345678")
        
        // When
        signupButton.tap()
        
        // Then
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 2))
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
