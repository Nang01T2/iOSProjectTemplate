//
//  LaunchInstructor.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

enum LaunchInstructor {
    case main
    case auth
    case onboarding
    
    // MARK: - Public methods
    
    static func configure( tutorialWasShown: Bool = false, isAuthorized: Bool = false) -> LaunchInstructor {
        
        switch (tutorialWasShown, isAuthorized) {
        case (true, false), (false, false): return .auth
        case (false, true): return .onboarding
        case (true, true): return .main
        }
    }
}
