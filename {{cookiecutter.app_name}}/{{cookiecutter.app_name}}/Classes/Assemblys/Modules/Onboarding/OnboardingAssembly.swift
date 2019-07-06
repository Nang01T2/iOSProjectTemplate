//
//  OnboardingAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

typealias OnboardingModule = Module<OnboardingModuleInput, OnboardingModuleOutput>

class OnboardingAssembly: Assembly {
    func build() -> OnboardingModule {
        
        // View
        let view = OnboardingViewController.instantiate(fromStoryboard: "Onboarding")
        
        return Module(view: view, input: view, output: view)
    }
}
