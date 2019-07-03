//
//  Environment.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

enum Environment {
    
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let apiBaseURL = "API_BASE_URL"
            static let apiKey = "API_KEY"
        }
    }
    
    static var apiBaseURL: URL {
        return URL(string:Configuration.value(for: Keys.Plist.apiBaseURL))!
    }
    
    static var apiKey: String {
        return Configuration.value(for: Keys.Plist.apiKey)
    }
}
