//
//  TabbarCoordinatorAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

final class TabbarCoordinatorAssembly: ModuleAssembly {
    func build(router: Router) -> TabbarCoordinatorType {
        let coordinator = TabbarCoordinator(router: router)
        return coordinator
    }
}
