//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Muhammad Shayan on 15/08/2022.
//

import XCTest
@testable import PhotoApp

class SignupViewControllerTests: XCTestCase {

    var storyBoard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUp() {
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyBoard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut?.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        storyBoard = nil
    }
    
    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() {
        // Then
        XCTAssertEqual(sut?.userFirstNameTextField.text, "")
        XCTAssertEqual(sut?.userLastNameTextField.text, "")
        XCTAssertEqual(sut?.userEmailTextField.text, "")
        XCTAssertEqual(sut?.userPasswordTextField.text, "")
        XCTAssertEqual(sut?.userRepeatPasswordTextField.text, "")
    }

}
