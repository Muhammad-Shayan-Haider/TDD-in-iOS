//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Muhammad Shayan on 15/08/2022.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var userRepeatPasswordTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            let signupWebService = SignupWebService(urlString: SignupConstants.signupURLString)
            signupPresenter = SignupPresenter(formModelValidator: signupModelValidator,
                                              webService: signupWebService,
                                              delegate: self)
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func signupButtonTapped(_ sender: UIButton) {
        let signupFormModel = SignupFormModel(firstName: userFirstNameTextField.text ?? "",
                                              lastName: userLastNameTextField.text ?? "",
                                              email: userEmailTextField.text ?? "",
                                              password: userPasswordTextField.text ?? "",
                                              repeatPassword: userRepeatPasswordTextField.text ?? "")
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
}

extension SignupViewController: SignupViewDelegate {
    func successfulSignup() {
        let alert = UIAlertController(title: "Success", message: "You have signed up", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "You request cannot be processed at this moment!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
}
