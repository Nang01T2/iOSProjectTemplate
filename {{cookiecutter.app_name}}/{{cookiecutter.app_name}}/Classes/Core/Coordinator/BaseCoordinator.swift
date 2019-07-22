//
//  BaseCoordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit
import Swinject

class BaseCoordinator: CoordinatorType, Presentable {
    
    /// Unique identifier
    internal let identifier = UUID()
    
    // MARK: Vars and Lets
    
    /// Dictionary of child coordinators
    private var childCoordinators = [UUID: CoordinatorType]()

    let router: Router
    let dependencyManager: DependencyManager

    // MARK: - Init
    init(dependencyManager: DependencyManager = DependencyManager.shared, router: Router) {
        self.router = router
        self.dependencyManager = dependencyManager
    }

    deinit {
        print("Dealloc class: \(self)<\(Unmanaged.passUnretained(self).toOpaque())>")
    }

    // MARK: - Coordinator
    
    func start() {
        start(with: nil)
    }
    
    func start(with option: DeepLinkOption?) {
        fatalError("Children should be implemented the `start` method.")
    }

    func toPresent() -> UIViewController? {
        return router.toPresent()
    }
    
    // MARK: Helpers
    func addChild(_ coordinator: CoordinatorType) {
        childCoordinators[coordinator.identifier] = coordinator
    }
    
    func removeChild(_ coordinator: CoordinatorType?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        childCoordinators[coordinator.identifier] = nil
    }
}
