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
    
    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        // Then
        // Testing that whether the textField is nil or not.
        let firstNameTextField = try XCTUnwrap(sut.userFirstNameTextField, "The firstNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.userFirstNameTextField, "The lastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(sut.userFirstNameTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.userFirstNameTextField, "The passwordTextField is not connected to an IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.userFirstNameTextField, "The repeatPasswordTextField is not connected to an IBOutlet")
        XCTAssertEqual(firstNameTextField.text, "")
        XCTAssertEqual(lastNameTextField.text, "")
        XCTAssertEqual(emailTextField.text, "")
        XCTAssertEqual(passwordTextField.text, "")
        XCTAssertEqual(repeatPasswordTextField.text, "")
    }
    
    func testViewController_WhenCreated_HasSignupButtonAndAction() throws {
        // Given
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "Signup button does not have outlet")
        
        // When
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button does not have the action")
        
        // Then
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:", "There is no action named signupButtonTapped")
    }

}
