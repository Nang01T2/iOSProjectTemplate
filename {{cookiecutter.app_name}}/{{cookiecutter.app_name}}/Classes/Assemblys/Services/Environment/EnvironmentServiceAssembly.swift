//
//  EnvironmentServiceAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

class EnvironmentServiceAssembly: Assembly {
    func build() -> EnvironmentServiceType {
        let service = EnvironmentService()
        return service
    }
}
