//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Muhammad Shayan on 13/08/2022.
//

import XCTest
@testable import PhotoApp

class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        signupFormRequestModel = SignupFormRequestModel(firstName: "Sergey", lastName: "Karg", email: "test@test.com", password: "124123")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }

    func testSignupWebService_WhenGivenSuccessfulResponse_ReturnSuccess() {
        // Given
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expection = self.expectation(description: "Sign up Web Service Response Expectation")
        
        // When
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Then
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expection.fulfill()
        }
        
        self.wait(for: [expection], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Given
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expection = self.expectation(description: "Sign up response for different json structure")
        
        // When
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            // Then
            XCTAssertNil(signupResponseModel, "Response model should have been nil")
            XCTAssertEqual(error, SignupError.responseModelParsingError, "sign up method did not return expected error")
            expection.fulfill()
        }
        
        self.wait(for: [expection], timeout: 5)
    }

    func testSignupWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Given
        sut = SignupWebService(urlString: "")
        let expectation = self.expectation(description: "An empty url string expection")
        // When
        sut.signup(withForm: signupFormRequestModel) { (signResponseModel, error) in
            // Then
            XCTAssertEqual(error, SignupError.invalidURLError, "Sign up method did not return expected error for invalid error")
            XCTAssertNil(signResponseModel)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
}
