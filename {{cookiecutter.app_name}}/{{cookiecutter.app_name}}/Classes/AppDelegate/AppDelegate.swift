//
//  AppDelegate.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appDelegate = AppDelegateFactory.makeDefault()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = appDelegate.application?(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        appDelegate.applicationWillResignActive?(application)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        appDelegate.applicationDidEnterBackground?(application)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        appDelegate.applicationWillEnterForeground?(application)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        appDelegate.applicationDidBecomeActive?(application)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        appDelegate.applicationWillTerminate?(application)
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        appDelegate.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        appDelegate.application?(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }

}

