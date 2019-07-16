//
//  AppDelegate.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: AppDelegateManager {

    var window: UIWindow? = UIWindow()
    lazy var container : Container = {
        let container = Container()
        
        // Setup coordinators
        container.registerAssembly(AppCoordinatorAssembly.self)
        container.registerAssembly(AuthCoordinatorAssembly.self)
        container.registerAssembly(MainCoordinatorAssembly.self)
        
        // Setup Modules
        container.registerAssembly(LoginAssembly.self)
        container.registerAssembly(RegistrationAssembly.self)
        container.registerAssembly(OnboardingAssembly.self)
        container.registerAssembly(MainAssembly.self)
        
        // Setup services
        container.registerAssembly(EnvironmentServiceAssembly.self)
        container.registerAssembly(AppConfigServiceAssembly.self)
        
        return container
    }()
    
    override var appDelegates: [AppDelegateType] {
        return [
            LaunchAppDelegate(container: container, window: window),
            PushNotificationsAppDelegate(),
            ThirdPartiesConfigurationAppDelegate()
        ]
    }

}
