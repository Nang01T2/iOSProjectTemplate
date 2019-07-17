//
//  OnboardingContracts.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

// Module Input
protocol OnboardingModuleInput {
    
}

// Module Output
protocol OnboardingModuleOutput {
    var onCompleted: (() -> Void)? { get set }
}
