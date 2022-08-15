//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Muhammad Shayan on 15/08/2022.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
