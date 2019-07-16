//
//  MainCoordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class MainCoordinator: BaseCoordinator, MainCoordinatorType {
    override func start() {
        let mainModule = container.resolve(MainAssembly.self)!.build()
        router.setRootModule(mainModule)
    }
    
    override func toPresent() -> UIViewController? {
        return router.rootViewController
    }
}
