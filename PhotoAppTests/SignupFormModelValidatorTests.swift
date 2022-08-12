//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Muhammad Shayan on 12/08/2022.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!
    
    override func setUp() {
        sut = SignupFormModelValidator()
    }

    override func tearDown() {
        sut = nil
    }
    
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Given
        
        // When
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Sergey")
        
        // Then
        XCTAssertTrue(isFirstNameValid, "First name is valid!")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Given
        
        // When
        let isFirstNameValid = sut.isFirstNameValid(firstName: "S")
        
        // Then
        XCTAssertFalse(isFirstNameValid, "First name is too short!")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // When
        let isFirstNameValid = sut.isFirstNameValid(firstName: "SergeySergey")
        
        // Then
        XCTAssertFalse(isFirstNameValid, "First name is too long!")
    }
    
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // When
        let isLastNameValid = sut.isLastNameValid(lastName: "Sergey")
        
        // Then
        XCTAssertTrue(isLastNameValid, "Last name is valid!")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // When
        let isLastNameValid = sut.isLastNameValid(lastName: "")
        
        // Then
        XCTAssertFalse(isLastNameValid, "Last name is too short!")
    }
    
    func testSignupFormValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // When
        let isLastNameValid = sut.isLastNameValid(lastName: "SergeySergey")
        
        // Then
        XCTAssertFalse(isLastNameValid, "Last name is too long!")
    }
    
    func testSignupFormValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        // When
        let isPasswordValid = sut.isPasswordValid(password: "Wertwe123")
        
        // Then
        XCTAssertTrue(isPasswordValid, "Password is valid!")
    }
    
    func testSignupFormValidator_WhenTooShortPasswordProvided_ShouldReturnFalses() {
        // When
        let isPasswordValid = sut.isPasswordValid(password: "")
        
        // Then
        XCTAssertFalse(isPasswordValid, "Password is too short!")
    }

}
