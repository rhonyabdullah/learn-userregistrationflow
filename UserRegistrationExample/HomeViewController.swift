//
//  HomeViewController.swift
//  UserRegistrationExample
//
//  Created by Rhony on 07/06/20.
//  Copyright © 2020 Rhony. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var firstNameLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func SignOutBtn(_ sender: Any) {
        signOut()
    }

    @IBAction func LoadProfiles(_ sender: Any) {
        loadProfile()
    }

    private func signOut() {

    }

    private func loadProfile() {

    }

}
