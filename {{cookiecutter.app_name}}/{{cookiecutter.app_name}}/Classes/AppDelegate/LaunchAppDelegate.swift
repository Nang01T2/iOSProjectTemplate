//
//  LaunchAppDelegate.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit
import Swinject

class LaunchAppDelegate: AppDelegateType {
    
    var window: UIWindow?
    let container: Container
    
    lazy var appCoordinator: AppCoordinatorType = {
        return container.resolve(AppCoordinatorAssembly.self)!.build()
    }()
    
    init(container: Container, window: UIWindow?) {
        self.container = container
        self.window = window
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // App Config
        let appConfig = container.resolve(AppConfigServiceAssembly.self)!.build()
        
        // Set defaults
        appConfig.registerDefaults()
        
        // Setup window
        window?.rootViewController = appCoordinator.toPresent()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        // Configure deep link
        let notification = launchOptions?[.remoteNotification] as? [String: AnyObject]
        let deepLink = DeepLinkOption.build(with: notification)
        appCoordinator.start(with: deepLink)
        
        return true
    }
}
