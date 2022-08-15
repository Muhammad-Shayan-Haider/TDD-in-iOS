//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Muhammad Shayan on 15/08/2022.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegate {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var failureSignupCounter = 0
    var error: SignupError?
    
    func successfulSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        self.error = error
        failureSignupCounter += 1
        expectation?.fulfill()
    }
}
