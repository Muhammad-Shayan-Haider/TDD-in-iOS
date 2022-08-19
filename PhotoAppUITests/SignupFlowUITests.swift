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

        let firstName = app.textFields["First name"]
        let lastName = app.textFields["Last name"]
        let email = app.textFields["Email"]
        let password = app.secureTextFields["Password"]
        let repeatPassword = app.secureTextFields["Repeat password"]
        let signupButton = app/*@START_MENU_TOKEN@*/.staticTexts["Signup"]/*[[".buttons[\"Signup\"].staticTexts[\"Signup\"]",".staticTexts[\"Signup\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            
        XCTAssertTrue(firstName.isEnabled)
        XCTAssertTrue(lastName.isEnabled)
        XCTAssertTrue(email.isEnabled)
        XCTAssertTrue(password.isEnabled)
        XCTAssertTrue(repeatPassword.isEnabled)
        XCTAssertTrue(signupButton.isEnabled)
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
