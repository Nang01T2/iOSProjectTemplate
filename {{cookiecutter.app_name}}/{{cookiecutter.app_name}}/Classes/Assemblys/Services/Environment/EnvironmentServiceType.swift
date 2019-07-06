//
//  EnvironmentServiceType.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

enum EnvironmentKey: String {
    case apiBaseURL = "API_BASE_URL"
    case apiKey = "API_KEY"
    case appVersion = "CFBundleShortVersionString"
    case buildNumber = "CFBundleVersion"
    
    var value: String {
        return self.rawValue
    }
}

protocol EnvironmentServiceType {
	var apiBaseURL: URL { get }
    var apiKey: String { get }
    
    func obtainEnvironment<T>(for key: EnvironmentKey) -> T
}
