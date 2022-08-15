//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Muhammad Shayan on 15/08/2022.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated = false
    var isLastNameValidated = false
    var isEmailValidated = false
    var isPasswordValidated = false
    var didPasswordsMatch = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isFirstNameValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func isEmailValid(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        didPasswordsMatch = true
        return didPasswordsMatch
    }
}
