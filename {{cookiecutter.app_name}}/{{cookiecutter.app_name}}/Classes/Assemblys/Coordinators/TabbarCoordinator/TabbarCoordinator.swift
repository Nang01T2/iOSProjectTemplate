//
//  TabbarCoordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class TabbarCoordinator: BaseCoordinator, TabbarCoordinatorType {
    lazy var tabbarModule: TabbarModule = {
        let testViewController = dependencyManager.resolve(TestAssembly.self)!.build()
        let debugViewController = dependencyManager.resolve(DebugAssembly.self)!.build()
        var tabbarModule = dependencyManager.resolve(TabbarAssembly.self)?.build(with: testViewController,
                                                                                 debugViewController)
        return tabbarModule!
    }()
    
    override func start() {
        router.setRootModule(tabbarModule)
    }
}
