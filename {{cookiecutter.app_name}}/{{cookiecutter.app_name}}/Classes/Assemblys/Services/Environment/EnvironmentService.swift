//
//  EnvironmentService.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

class EnvironmentService: EnvironmentServiceType {
    lazy var apiBaseURL: URL = {
        return URL(string: Configuration.value(for: EnvironmentKey.apiBaseURL.value))!
    }()
    
    lazy var apiKey: String = {
        return Configuration.value(for: EnvironmentKey.apiKey.value)
    }()
}

extension EnvironmentService {
    func obtainEnvironment<T>(for key: EnvironmentKey) -> T {
        return Configuration.value(for: key.value) as T
    }
}
