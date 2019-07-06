//
//  AppConfigServiceAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

class AppConfigServiceAssembly: Assembly {
    func build() -> AppConfigServiceType {
        let service = AppConfigService()
        return service
    }
}
