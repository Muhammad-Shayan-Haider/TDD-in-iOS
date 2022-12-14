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
    
    func testSignupFormValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        // When
        let isPasswordValid = sut.isPasswordValid(password: "")
        
        // Then
        XCTAssertFalse(isPasswordValid, "Password is too short!")
    }
    
    func testSignupFormValidator_WhenPasswordContainsNumbersAndCapitalLetters_ShouldReturnTrue() {
        // When
        let isPasswordValid = sut.isPasswordValid(password: "Wertweuygyu3")
        
        // Then
        XCTAssertTrue(isPasswordValid, "Password contains numbers and capital letters!")
    }
    
    func testSignupFormValidator_WhenEmailIsValid_ShouldReturnTrue() {
        // When
        let isEmailValid = sut.isEmailValid(email: "abc@gmail.com")
        
        // Then
        XCTAssertTrue(isEmailValid, "Email is valid!")
    }
    
    func testSignupFormValidator_WhenInvalidEmailProvided_ShouldReturnFalse() {
        // When
        let isEmailValid = sut.isEmailValid(email: "abc@gmailcom")
        
        // Then
        XCTAssertFalse(isEmailValid, "Email is invalid!")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // When
        let doPasswordsMatch = sut.doPasswordsMatch(password: "", repeatPassword: "")
        
        // Then
        XCTAssertTrue(doPasswordsMatch, "Passwords match!")
    }
    
    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // When
        let doPasswordsMatch = sut.doPasswordsMatch(password: "123123", repeatPassword: "23424")
        
        // Then
        XCTAssertFalse(doPasswordsMatch, "Passwords do not match!")
    }

}
