//
//  LoginViewController.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded, LoginModuleOutput {
    
    var onAuthCanceled: (() -> Void)?
    var onAuthCompleted: ((String) -> Void)?
    var onRegistrationCompleted: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
}

// MARK: Module Input
extension LoginViewController: LoginModuleInput {
    
}

// MARK: Button Action
extension LoginViewController {
    @IBAction func cancelButtonAction(_ sender: Any) {
        onAuthCanceled?()
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        onAuthCompleted?("auth token")
    }
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        onRegistrationCompleted?()
    }
}
