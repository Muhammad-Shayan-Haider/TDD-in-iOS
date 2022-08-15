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
    var mockSignupViewDelegate: MockSignupViewDelegate!
    
    override func setUp() {
        signupFormModel = SignupFormModel(firstName: "Sergey",
                                              lastName: "Karg",
                                              email: "test@test.com",
                                              password: "124123",
                                              repeatPassword: "124123")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                              webService: mockSignupWebService,
                              delegate: mockSignupViewDelegate)
    }

    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
        mockSignupViewDelegate = nil
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
    
    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Given
        let myExpectation = expectation(description: "Expected the successful signup")
        mockSignupViewDelegate.expectation = myExpectation
        
        // When
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //Then
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1)
    }
    
    func testSignupPresenter_WhenSignupOperationFailed_CallsFailureOnViewDelegate() {
        // Given
        let expectation = expectation(description: "Expected failure on signup")
        mockSignupViewDelegate.expectation = expectation
        mockSignupWebService.shouldThrowError = true
        
        // When
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [expectation], timeout: 2)
        
        // Then
        XCTAssertEqual(mockSignupViewDelegate.failureSignupCounter, 1)
        XCTAssertNotNil(mockSignupViewDelegate.error)
    }
}
