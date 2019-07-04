//
//  AppCoordinatorAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class AppCoordinatorAssembly: Assembly {
    func build() -> AppCoordinator {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)
        let coordinator = AppCoordinator(container: container, router: router)
        return coordinator
    }
}
