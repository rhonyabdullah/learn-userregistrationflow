//
//  SignInViewController.swift
//  UserRegistrationExample
//
//  Created by Rhony on 29/05/20.
//  Copyright © 2020 Rhony. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet var userNameTf: UITextField!
    @IBOutlet var userPasswordTf: UITextField!
    @IBAction func signInBtn(_ sender: UIButton) { doSignIn() }
    @IBAction func registerBtn(_ sender: UIButton) { register() }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func doSignIn() {
        print("Sign in clicked")
    }

    private func register() {
        guard let registerController = storyboard?.instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController
            else { return }
        registerController.modalPresentationStyle = .fullScreen
        self.present(registerController, animated: true)
    }

}
