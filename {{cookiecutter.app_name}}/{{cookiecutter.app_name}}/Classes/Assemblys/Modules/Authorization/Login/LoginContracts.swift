//
//  LoginContracts.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

// Module Input
protocol LoginModuleInput {
    
}

// Module Output
protocol LoginModuleOutput {
    var onAuthCanceled: (() -> Void)? { get set }
    var onAuthCompleted: ((String) -> Void)? { get set }
    var onRegistrationCompleted: (() -> Void)? { get set }
}
