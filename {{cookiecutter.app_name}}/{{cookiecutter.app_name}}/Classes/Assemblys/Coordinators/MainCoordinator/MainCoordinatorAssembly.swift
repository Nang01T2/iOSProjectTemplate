//
//  MainCoordinatorAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

final class MainCoordinatorAssembly: ModuleAssembly {
    func build(router: Router) -> MainCoordinatorType {
        let coordinator = MainCoordinator(router: router)
        return coordinator
    }
}
