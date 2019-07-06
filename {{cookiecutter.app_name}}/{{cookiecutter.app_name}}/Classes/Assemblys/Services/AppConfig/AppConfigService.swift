//
//  AppConfigService.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation
import SwifterSwift

class AppConfigService: AppConfigServiceType {
    fileprivate var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
}

extension AppConfigService {
    func obtainConfig<T>(for key: AppConfigKey) -> T {
        guard let value = userDefaults[key.value] else { fatalError("Config key not found") }
        guard let result = value as? T else { fatalError("Expecting another type") }
        return result
    }
    
    func setConfig<T>(value: T, for key: AppConfigKey) {
        userDefaults[key.value] = value
        userDefaults.synchronize()
    }
}
