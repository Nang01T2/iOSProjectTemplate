//
//  DependencyProvider.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation
import Swinject

class DependencyManager {
    static let shared = DependencyManager()
    
    let container = Container()
    let assembler: Assembler
    
    private init() {
        self.assembler = Assembler(container: container)
    }
    
    func registerAssembly(_ assembly: Assembly) {
        self.assembler.apply(assembly: assembly)
    }
    
    func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return self.assembler.resolver.resolve(serviceType)
    }
}
