//
//  ModuleAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation
import Swinject

protocol ModuleAssembly: Assembly {
    init()
}

extension ModuleAssembly {
    
    func assemble(container: Container) {
        container.register(type(of: self)) { _ in
            return type(of: self).init()
        }.inObjectScope(.container)
    }

}
