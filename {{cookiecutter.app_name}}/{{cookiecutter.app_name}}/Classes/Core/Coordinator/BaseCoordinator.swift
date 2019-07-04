//
//  BaseCoordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit
import Swinject

class BaseCoordinator : NSObject, Coordinator {
    
    // MARK: Vars and Lets
    var childCoordinators : [Coordinator] = []
    var finishFlow: (() -> Void)?

    let router: Router
    let container: Container
    
    // MARK: - Init
    init(container: Container, router: Router) {
        self.router = router
        self.container = container
    }
    
    // MARK: - Coordinator
    
    func start() {
        start(with: nil)
    }
    
    func start(with option: DeepLinkOption?) {
        fatalError("Children should implement `start`.")
    }
    
    func toPresent() -> UIViewController? {
        return router.toPresent()
    }
    
    // MARK - Helpers
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
