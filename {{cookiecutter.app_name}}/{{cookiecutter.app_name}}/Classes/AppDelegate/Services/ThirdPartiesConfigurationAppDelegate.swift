//
//  ThirdPartiesConfigurationAppDelegate.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class ThirdPartiesConfigurationAppDelegate: AppDelegateService {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Setup third parties
        LogService.info("Third parties configuration...")
        return true
    }
}
