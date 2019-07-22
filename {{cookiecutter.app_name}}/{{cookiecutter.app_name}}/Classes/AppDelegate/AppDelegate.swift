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
    
    override var services: [AppDelegateService] {
        return [
            LaunchAppDelegate(window: window),
            PushNotificationsAppDelegate(),
            ThirdPartiesConfigurationAppDelegate()
        ]
    }
    
    override init() {
        AppAssembly().registerAssemblies()
    }

}
