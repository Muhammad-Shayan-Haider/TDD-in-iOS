//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Muhammad Shayan on 13/08/2022.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupWebService_WhenGivenSuccessfulResponse_ReturnSuccess() {
        // Given
        let sut = SignupWebService(urlString: "http://appsdeveloperblog.com:8080/sign-mock-service/users")
        let signupFormRequestModel = SignupFormRequestModel(firstName: "", lastName: "", email: "", password: "")
        let expection = self.expectation(description: "Sign up Web Service Response Expectation")
        
        // When
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Then
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expection.fulfill()
        }
        
        self.wait(for: [expection], timeout: 5)
    }

}
