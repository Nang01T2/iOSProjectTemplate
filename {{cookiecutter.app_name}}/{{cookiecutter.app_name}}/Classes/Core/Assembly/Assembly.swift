//
//  AssemblyType.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation
import Swinject

class Assembly {
    var container: Container

    required init(container: Container) {
        self.container = container
    }
}

extension Container {
    func registerAssembly<T: Assembly>(_ assembly: T.Type) {
        self.register(assembly) { _ in assembly.init(container: self)}
    }
}
