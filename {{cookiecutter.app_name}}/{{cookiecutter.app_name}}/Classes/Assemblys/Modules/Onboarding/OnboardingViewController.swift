//
//  OnboardingViewController.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, Storyboarded, OnboardingModuleOutput {
    
    var onCompleted: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Module Input
extension OnboardingViewController: OnboardingModuleInput {
    
}

// MARK: Button Action
extension OnboardingViewController {
    @IBAction func completeOnboardingButtonAction(_ sender: UIButton) {
        onCompleted?()
    }
}
