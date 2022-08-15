//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Muhammad Shayan on 15/08/2022.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegate?
    
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegate) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        if !formModelValidator.isEmailValid(email: formModel.email) {
            return
        }
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName,
                                                  lastName: formModel.lastName,
                                                  email: formModel.email,
                                                  password: formModel.password)
        
        webService.signup(withForm: requestModel) { [weak self] (signupResponseModel, error) in
            if let _ = signupResponseModel {
                self?.delegate?.successfulSignup()
            }
        }
    }
}
