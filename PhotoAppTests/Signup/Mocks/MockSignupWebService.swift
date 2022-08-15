//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Muhammad Shayan on 15/08/2022.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled = false
    var shouldThrowError = false
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true
        if !shouldThrowError {
            let responseModel = SignupResponseModel(status: "ok")
            completionHandler(responseModel, nil)
        } else {
            completionHandler(nil, SignupError.failedRequest(description: "failed request"))
        }
    }
}
