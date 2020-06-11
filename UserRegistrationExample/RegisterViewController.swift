//
//  RegisterViewController.swift
//  UserRegistrationExample
//
//  Created by Rhony on 01/06/20.
//  Copyright © 2020 Rhony. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    private let viewModel: RegisterViewModel = RegisterViewModel()
    private var activityIndicator: UIActivityIndicatorView? = nil

    @IBOutlet var firstNameTf: UITextField!
    @IBOutlet var lastNameTf: UITextField!
    @IBOutlet var emailTf: UITextField!
    @IBOutlet var passwordTf: UITextField!
    @IBOutlet var repeatPassTf: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }

    @IBAction func signUp(_ sender: Any) {
        if (firstNameTf.text?.isEmpty)! ||
            (lastNameTf.text?.isEmpty)! ||
            (emailTf.text?.isEmpty)! ||
            (passwordTf.text?.isEmpty)! ||
            (repeatPassTf.text?.isEmpty)! {
            showAlertMsg("Field can not be empty")
            return
        }

        let password = passwordTf.text ?? ""
        let repeatPassword = repeatPassTf.text ?? ""
        
        print("Password: \(password)")
        print("RepeatPassword: \(repeatPassword)")
        
        if ((password.elementsEqual(repeatPassword)) != true) {
            showAlertMsg("Password didn't match")
            return
        }

        showUiIndicatorView()
        viewModel.getUsers(firstNameTf.text!,
            onSuccesss: { msg in
                self.removeUiIndicator()
                self.showAlertMsg(msg)
            },
            onError: { msg in
                print("Error message is \(msg)")
                self.showAlertMsg("Something went wrong!")
            })
    }

    private func showAlertMsg(_ msg: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) {
                (action: UIAlertAction!) in
                print("Ok button tapped")
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }

    private func showUiIndicatorView() {
        let indicatorView = UIActivityIndicatorView(style: .medium)
        indicatorView.center = view.center
        indicatorView.hidesWhenStopped = false
        indicatorView.startAnimating()
        view.addSubview(indicatorView)
        activityIndicator = indicatorView
    }

    private func removeUiIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator?.stopAnimating()
            self.activityIndicator?.removeFromSuperview()
        }
    }
}
