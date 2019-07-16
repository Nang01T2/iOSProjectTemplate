//
//  RegistrationAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

typealias RegistrationModule = Module<RegistrationModuleInput, RegistrationModuleOutput>

class RegistrationAssembly: Assembly {
    func build() -> RegistrationModule {
        
        // View
        let view = RegistrationViewController.instantiate(fromStoryboard: "Authentication")
        
        return Module(view: view, input: view, output: view)
    }
}
