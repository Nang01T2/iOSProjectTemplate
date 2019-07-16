//
//  RegistrationContracts.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

// Module Input
protocol RegistrationModuleInput {
    
}

// Module Output
protocol RegistrationModuleOutput {
    var onRegistrationCompleted: ((String) -> Void)? { set get }
}
