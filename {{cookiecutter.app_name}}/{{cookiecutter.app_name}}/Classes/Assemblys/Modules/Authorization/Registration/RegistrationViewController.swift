//
//  RegistrationViewController.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, Storyboarded, RegistrationModuleOutput {
    
    var onRegistrationCompleted: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registration"
    }
}

// MARK: Module Input
extension RegistrationViewController: RegistrationModuleInput {
    
}

// MARK: Button Action
extension RegistrationViewController {
    @IBAction func registerButtonAction(_ sender: Any) {
        onRegistrationCompleted?("Registration token")
    }
}
