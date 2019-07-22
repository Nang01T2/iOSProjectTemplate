//
//  LaunchAppDelegate.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit
import Swinject

class LaunchAppDelegate: AppDelegateService {
    
    var window: UIWindow?
    let dependencyManager = DependencyManager.shared
    
    lazy var appCoordinator: AppCoordinatorType = {
        return dependencyManager.resolve(AppCoordinatorAssembly.self)!.build()
    }()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // App Config
        let appConfig = dependencyManager.resolve(AppConfigServiceAssembly.self)!.build()
        
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
        
        // Env config
        guard let envConfig = dependencyManager.resolve(EnvironmentServiceAssembly.self)?.build() else {
            unableToResolve(EnvironmentServiceAssembly.self)
        }
        print("EVN: \(envConfig.apiBaseURL)")
        
        return true
    }
}
