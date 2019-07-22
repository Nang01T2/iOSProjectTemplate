//
//  AuthCoordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

class AuthCoordinator: BaseCoordinator, AuthCoordinatorType {
    
    var onAuthCompleted: ((String) -> Void)?
    var onAuthCanceled: (() -> Void)?
    
    lazy var loginModule: LoginModule = {
        var loginModule = dependencyManager.resolve(LoginAssembly.self)?.build()
        loginModule?.output.onAuthCanceled = { [weak self] in
            self?.onAuthCanceled?()
        }
        loginModule?.output.onAuthCompleted = { [weak self] token in
            self?.onAuthCompleted?(token)
        }
        loginModule?.output.onRegistrationCompleted = { [weak self] in
            self?.showRegistration()
        }
        return loginModule!
    }()
    
    lazy var registrationModule: RegistrationModule = {
        var registrationModule = dependencyManager.resolve(RegistrationAssembly.self)?.build()
        registrationModule?.output.onRegistrationCompleted = { [weak self] token in
            self?.onAuthCompleted?(token)
        }
        return registrationModule!
    }()
	
    override func start() {
        router.setRootModule(loginModule)
    }
    
    func showRegistration() {
        router.push(registrationModule)
    }
}
