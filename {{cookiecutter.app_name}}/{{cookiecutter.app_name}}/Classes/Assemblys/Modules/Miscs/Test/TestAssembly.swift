//
//  TestAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by Nang Nguyen on 7/16/19
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

typealias TestModule = Module<TestModuleInput, TestModuleOutput>

final class TestAssembly: ModuleAssembly {
    func build() -> TestModule {
        
        // View
        let view = TestViewController()
        
        return Module(view: view, input: view, output: view)
    }
}
