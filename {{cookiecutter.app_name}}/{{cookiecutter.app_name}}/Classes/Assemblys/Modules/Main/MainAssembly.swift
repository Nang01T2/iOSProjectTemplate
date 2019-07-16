//
//  MainAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

typealias MainModule = Module<MainModuleInput, MainModuleOutput>

class MainAssembly: Assembly {
    func build() -> MainModule {
        
        // View
        let view = MainViewController.instantiate(fromStoryboard: "Main")
        
        return Module(view: view, input: view, output: view)
    }
}
