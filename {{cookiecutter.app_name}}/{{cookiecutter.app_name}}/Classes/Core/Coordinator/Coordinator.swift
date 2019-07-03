//
//  Coordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

public protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var router: Router { get set }
    
    func start()
    func start(with option: DeepLinkOption?)
}

public extension Coordinator {
    
    func addChild(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
