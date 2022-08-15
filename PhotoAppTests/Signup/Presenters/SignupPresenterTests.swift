//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Muhammad Shayan on 15/08/2022.
//

import XCTest
@testable import PhotoApp

class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    
    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Sergey",
                                              lastName: "Karg",
                                              email: "test@test.com",
                                              password: "124123",
                                              repeatPassword: "124123")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService)
    }

    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
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
        // When
        sut.processUserSignup(formModel: signupFormModel)
        
        // Then
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled)
    }
}
