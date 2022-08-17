//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Muhammad Shayan on 17/08/2022.
//

import Foundation

protocol SignupPresenterProtocol {
    
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegate)
    func processUserSignup(formModel: SignupFormModel)
}
