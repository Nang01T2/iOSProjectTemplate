//
//  MainCoordinatorAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by Nang Nguyen on 7/6/19
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class MainCoordinatorAssembly: Assembly {
    func build() -> MainCoordinatorType {
        let navigationController = UINavigationController(rootViewController: UIViewController())
        let router = Router(navigationController: navigationController)

        let coordinator = MainCoordinator(container: container, router: router)
        return coordinator
    }
}
