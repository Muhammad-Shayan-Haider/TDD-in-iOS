//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Muhammad Shayan on 15/08/2022.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func isEmailValid(email: String) -> Bool
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
