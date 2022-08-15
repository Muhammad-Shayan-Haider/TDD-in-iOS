//
//  SignupViewDelegate.swift
//  PhotoApp
//
//  Created by Muhammad Shayan on 15/08/2022.
//

import Foundation

protocol SignupViewDelegate: AnyObject {
    
    func successfulSignup()
    func errorHandler(error: SignupError)
}
