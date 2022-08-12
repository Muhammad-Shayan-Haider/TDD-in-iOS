//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Muhammad Shayan on 12/08/2022.
//

import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    func isPasswordValid(password: String) -> Bool {
        var returnValue = false
        if password.count < SignupConstants.passwordMinLength {
            return returnValue
        }
        let passwordRegex = try! NSRegularExpression(pattern: "[A-Z]+[a-z]*[0-9]+")
        if passwordRegex.firstMatch(in: password, options: [], range: NSRange(password.startIndex..., in: password)) != nil {
            returnValue = true
        }
        return returnValue 
    }
    
    func isEmailValid(email: String) -> Bool {
        var resultValue = false
        let emailRegex = try! NSRegularExpression(pattern: "[a-zA-Z0-9]{3,}@[a-zA-Z0-9]{3,}\\.[a-zA-Z0-9]{3,}")
        if emailRegex.firstMatch(in: email, options: [], range: NSRange(email.startIndex..., in: email)) != nil {
            resultValue = true
        }
        return resultValue
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        var returnValue = true
        if password != repeatPassword {
            returnValue = false
        }
        return returnValue
    }
}
