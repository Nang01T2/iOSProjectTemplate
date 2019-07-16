//
//  BaseCoordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit
import Swinject

class BaseCoordinator : CoordinatorType, Presentable {
    
    // MARK: Vars and Lets
    var childCoordinators : [CoordinatorType] = []
    
    let router: Router
    let container: Container
    
    // MARK: - Init
    init(container: Container, router: Router) {
        self.router = router
        self.container = container
    }
    
    deinit {
        print("Dealloc class: \(self)<\(Unmanaged.passUnretained(self).toOpaque())>")
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
    func addChild(_ coordinator: CoordinatorType) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: CoordinatorType?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        // Clear child-coordinators recursively
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators.filter({ $0 !== coordinator }).forEach({ coordinator.removeChild($0) })
        }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
