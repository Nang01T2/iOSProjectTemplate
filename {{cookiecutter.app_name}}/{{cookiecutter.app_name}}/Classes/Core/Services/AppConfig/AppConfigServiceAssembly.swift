//
//  AppConfigServiceAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

final class AppConfigServiceAssembly: ModuleAssembly {
    func build() -> AppConfigServiceType {
        let service = AppConfigService()
        return service
    }
}
