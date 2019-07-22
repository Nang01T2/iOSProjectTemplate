//
//  TabbarAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

typealias TabbarModule = Module<TabbarModuleInput, TabbarModuleOutput>

final class TabbarAssembly: ModuleAssembly {
    func build(with viewControllers: Presentable...) -> TabbarModule {
        
        // View
        let view = TabbarViewController()
        view.tabBar.barTintColor = UIColor.App.yellow
        view.tabBar.tintColor = .black
        view.tabBar.isTranslucent = false
        view.viewControllers = viewControllers.map { $0.toPresent()! }
        
        return Module(view: view, input: view, output: view)
    }
}
