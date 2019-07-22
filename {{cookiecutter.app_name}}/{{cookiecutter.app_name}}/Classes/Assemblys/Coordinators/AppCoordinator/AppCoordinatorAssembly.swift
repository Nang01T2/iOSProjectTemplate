//
//  AppCoordinatorAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

final class AppCoordinatorAssembly: ModuleAssembly {
    
    func build() -> AppCoordinatorType {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)

        let coordinator = AppCoordinator(router: router)
        return coordinator
    }
    
}
