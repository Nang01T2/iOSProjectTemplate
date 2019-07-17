//
//  AppDelegateManager.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

typealias AppDelegateType = UIResponder & UIApplicationDelegate

class AppDelegateManager: AppDelegateType {
    
    var appDelegates: [AppDelegateType] { return [] }
    lazy private var _appDelegates: [AppDelegateType] = {
        return appDelegates
    }()
}

extension AppDelegateManager {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        _appDelegates.forEach { _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions) }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        _appDelegates.forEach { _ = $0.applicationWillResignActive?(application) }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        _appDelegates.forEach { _ = $0.applicationDidEnterBackground?(application) }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        _appDelegates.forEach { _ = $0.applicationWillEnterForeground?(application) }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        _appDelegates.forEach { _ = $0.applicationDidBecomeActive?(application) }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        _appDelegates.forEach { _ = $0.applicationWillTerminate?(application) }
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        _appDelegates.forEach { _ = $0.application?(application,
                                                    didRegisterForRemoteNotificationsWithDeviceToken: deviceToken) }
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        _appDelegates.forEach { _ = $0.application?(application,
                                                    didFailToRegisterForRemoteNotificationsWithError: error) }
    }
}
