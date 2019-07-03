//
//  BaseCoordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

open class BaseCoordinator : NSObject, Coordinator {
    
    // MARK: Vars and Lets
    public var childCoordinators : [Coordinator] = []
    public var router: Router
    public var finishFlow: (() -> Void)?

    // MARK: - Init
    public init(router: Router) {
        self.router = router
    }
    
    // MARK: - Coordinator
    
    open func start() {
        start(with: nil)
    }
    
    open func start(with option: DeepLinkOption?) {
        fatalError("Children should implement `start`.")
    }
    
    func toPresent() -> UIViewController? {
        return router.toPresent()
    }
}
