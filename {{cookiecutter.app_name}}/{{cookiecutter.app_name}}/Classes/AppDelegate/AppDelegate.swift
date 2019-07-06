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
        
        // Setup Modules
        container.registerAssembly(OnboardingAssembly.self)
        
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
