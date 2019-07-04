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
