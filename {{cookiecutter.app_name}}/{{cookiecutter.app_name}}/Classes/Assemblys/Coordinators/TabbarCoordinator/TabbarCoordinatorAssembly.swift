//
//  TabbarCoordinatorAssembly.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class TabbarCoordinatorAssembly: Assembly {
    func build(router: Router) -> TabbarCoordinatorType {
        let coordinator = TabbarCoordinator(container: container, router: router)
        return coordinator
    }
}
