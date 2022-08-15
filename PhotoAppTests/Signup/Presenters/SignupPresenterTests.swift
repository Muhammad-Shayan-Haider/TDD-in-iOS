//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Muhammad Shayan on 15/08/2022.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Given
        let signupFormModel = SignupFormModel(firstName: "Sergey",
                                              lastName: "Karg",
                                              email: "test@test.com",
                                              password: "124123",
                                              repeatPassword: "124123")
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService)
        // When
        sut.processUserSignup(formModel: signupFormModel)
        // Then
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated)
        XCTAssertTrue(mockSignupModelValidator.didPasswordsMatch)
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Given
        let signupFormModel = SignupFormModel(firstName: "Sergey",
                                              lastName: "Karg",
                                              email: "test@test.com",
                                              password: "124123",
                                              repeatPassword: "124123")
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService)
         
        // When
        sut.processUserSignup(formModel: signupFormModel)
        
        // Then
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled)
    }
}
