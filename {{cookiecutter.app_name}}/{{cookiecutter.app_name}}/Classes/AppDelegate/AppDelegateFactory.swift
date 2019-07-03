//
//  AppDelegateFactory.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

enum AppDelegateFactory {
    static func makeDefault() -> AppDelegateType {
        return AppDelegateManager(appDelegates: [PushNotificationsAppDelegate(),
                                                 LaunchConfigurationAppDelegate(),
                                                 ThirdPartiesConfigurationAppDelegate()])
    }
}
