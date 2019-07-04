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

    var window: UIWindow?
    lazy var container : Container = {
        let container = Container()
        container.register(AppCoordinatorAssembly.self) { _ in AppCoordinatorAssembly(container: container) }
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

