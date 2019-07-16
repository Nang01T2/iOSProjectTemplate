//
//  AuthCoordinatorAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class AuthCoordinatorAssembly: Assembly {
    func build(router: Router) -> AuthCoordinatorType {
//        let navigationController = UINavigationController(rootViewController: UIViewController())
//        let router = Router(navigationController: navigationController)
        
        let coordinator = AuthCoordinator(container: container, router: router)
        
        return coordinator
    }
}
