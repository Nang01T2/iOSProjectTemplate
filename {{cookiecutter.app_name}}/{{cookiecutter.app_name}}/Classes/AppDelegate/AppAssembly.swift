//
//  AppAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by Nang Nguyen on 7/22/19.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

final class AppAssembly {
    
    lazy var dependencyManager: DependencyManager = {
        return DependencyManager.shared
    }()
    
    func registerAssemblies() {
        // Setup coordinators
        dependencyManager.registerAssembly(AppCoordinatorAssembly())
        dependencyManager.registerAssembly(AuthCoordinatorAssembly())
        dependencyManager.registerAssembly(MainCoordinatorAssembly())
        dependencyManager.registerAssembly(TabbarCoordinatorAssembly())
        
        // Setup Modules
        dependencyManager.registerAssembly(LoginAssembly())
        dependencyManager.registerAssembly(RegistrationAssembly())
        dependencyManager.registerAssembly(OnboardingAssembly())
        dependencyManager.registerAssembly(MainAssembly())
        dependencyManager.registerAssembly(TabbarAssembly())
        
        dependencyManager.registerAssembly(TestAssembly())
        dependencyManager.registerAssembly(DebugAssembly())
        
        // Setup services
        dependencyManager.registerAssembly(EnvironmentServiceAssembly())
        dependencyManager.registerAssembly(AppConfigServiceAssembly())
    }
}
