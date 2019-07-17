//
//  DebugAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by Nang Nguyen on 7/16/19
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

typealias DebugModule = Module<DebugModuleInput, DebugModuleOutput>

class DebugAssembly: Assembly {
    func build() -> DebugModule {
        
        // View
        let view = DebugViewController()
        
        return Module(view: view, input: view, output: view)
    }
}
