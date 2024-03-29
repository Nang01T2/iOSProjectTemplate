//
//  AppConfigServiceType.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

enum AppConfigKey: String {
    case authToken
    case onboardingWasShown
    
    var value: String {
        return self.rawValue
    }
    
    static var defaultValues: [String: Any] = [
        AppConfigKey.authToken.value: "",
        AppConfigKey.onboardingWasShown.value: false
    ]
}

protocol AppConfigServiceType {
    func obtainConfig<T>(for key: AppConfigKey) -> T
    func setConfig<T>(value: T, for key: AppConfigKey)
    
    func registerDefaults()
}
