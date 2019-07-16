//
//  LoginAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

typealias LoginModule = Module<LoginModuleInput, LoginModuleOutput>

class LoginAssembly: Assembly {
    func build() -> LoginModule {
        
        // View
        let view = LoginViewController.instantiate(fromStoryboard: "Authentication")
        
        return Module(view: view, input: view, output: view)
    }
}
