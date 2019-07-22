//
//  LogServiceAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by Nang Nguyen on 7/22/19
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

final class LogServiceAssembly: ModuleAssembly {
    func build() -> LogServiceType {
        let service = LogService()
        return service
    }
}
