//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Muhammad Shayan on 13/08/2022.
//

import Foundation

class SignupWebService {
    
    private var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func signup(withForm: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        guard let url = URL(string: urlString) else {
            // TODO: create a unit test to test that url is nil or not
            return
        }
        
    }
}
