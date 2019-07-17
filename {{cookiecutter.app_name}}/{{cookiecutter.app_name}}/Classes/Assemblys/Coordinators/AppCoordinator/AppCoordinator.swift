//
//  AppCoordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

class AppCoordinator: BaseCoordinator, AppCoordinatorType {
    
	private lazy var appConfig: AppConfigServiceType = {
        return container.resolve(AppConfigServiceAssembly.self)!.build()
    }()
    
    private var onboardingWasShown: Bool {
        set { appConfig.setConfig(value: newValue, for: .onboardingWasShown) }
        get { return appConfig.obtainConfig(for: .onboardingWasShown) }
    }
    
    private var authToken: String {
        set { appConfig.setConfig(value: newValue, for: .authToken) }
        get { return appConfig.obtainConfig(for: .authToken) }
    }
    
    private var instructor: LaunchInstructor {
        //return LaunchInstructor.configure(tutorialWasShown: onboardingWasShown, isAuthorized: !authToken.isEmpty)
        return .mainTabbar
    }
    
    // MARK: - Coordinator
    
    override func start(with option: DeepLinkOption?) {
        if let option = option {
            switch option {
            case .home: runMainFlow()
            }
        } else {
            switch instructor {
            case .auth: runAuthFlow()
            case .onboarding: runOnboardingFlow()
            case .main: runMainFlow()
            case .mainTabbar: runTabbarFlow()
            }
        }
        
    }
    
    // MARK: - Private methods
    
    private func runAuthFlow() {
        let authCoordinator = container.resolve(AuthCoordinatorAssembly.self)!.build(router: router)
        authCoordinator.onAuthCanceled = { [weak self, weak authCoordinator] in
            self?.removeChild(authCoordinator)
            self?.router.dismissModule()
            self?.start()
        }
        
        authCoordinator.onAuthCompleted = { [weak self, weak authCoordinator] token in
            print("onAuthCompleted - Token: \(token)")
            self?.authToken = token
            self?.removeChild(authCoordinator)
            self?.router.dismissModule()
            self?.start()
        }
        
        addChild(authCoordinator)
        authCoordinator.start()
    }
    
    private func runOnboardingFlow() {
        var onboardingModule = container.resolve(OnboardingAssembly.self)?.build()
        onboardingModule?.output.onCompleted = { [weak self] in
            self?.onboardingWasShown = true
            self?.start()
        }
        self.router.setRootModule(onboardingModule, hideBar: true)
    }
    
    private func runMainFlow() {
        let mainCoordinator = container.resolve(MainCoordinatorAssembly.self)!.build(router: router)
        addChild(mainCoordinator)
        mainCoordinator.start()
    }
    
    private func runTabbarFlow() {
        let tabbarCoordinator = container.resolve(TabbarCoordinatorAssembly.self)!.build(router: router)
        addChild(tabbarCoordinator)
        tabbarCoordinator.start()
    }
}
