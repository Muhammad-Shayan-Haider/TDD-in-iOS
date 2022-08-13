//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Muhammad Shayan on 13/08/2022.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
