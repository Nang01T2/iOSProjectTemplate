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
    
}

extension AppDelegateManager {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        appDelegates.forEach { _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions) }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        appDelegates.forEach { _ = $0.applicationWillResignActive?(application) }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        appDelegates.forEach{ _ = $0.applicationDidEnterBackground?(application) }
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        appDelegates.forEach{ _ = $0.applicationWillEnterForeground?(application) }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        appDelegates.forEach{ _ = $0.applicationDidBecomeActive?(application) }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        appDelegates.forEach{ _ = $0.applicationWillTerminate?(application) }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        appDelegates.forEach { _ = $0.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken) }
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        appDelegates.forEach { _ = $0.application?(application, didFailToRegisterForRemoteNotificationsWithError: error) }
    }
}
