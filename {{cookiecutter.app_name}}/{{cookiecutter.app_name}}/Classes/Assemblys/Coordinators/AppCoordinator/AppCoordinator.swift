//
//  AppCoordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by Nang Nguyen on 7/6/19
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

class AppCoordinator: BaseCoordinator, AppCoordinatorType {
	private var launchInstructor = LaunchInstructor.configure()
    
    // MARK: - Coordinator
    
    override func start(with option: DeepLinkOption?) {
        /*
        if option != nil {
            // TODO
        } else {
            switch launchInstructor {
            case .onboarding: runOnboardingFlow()
            case .auth: runAuthFlow()
            case .main: runMainFlow()
            }
        }
        */
        runOnboardingFlow()
    }
    
    // MARK: - Private methods
    
    private func runAuthFlow() {
//        let authCoordinator = AuthCoordinator(router: self.router as! Router)
//        authCoordinator.finishFlow = { [weak self, weak authCoordinator] in
//            self?.removeDependency(authCoordinator)
//            self?.launchInstructor = LaunchInstructor.configure(tutorialWasShown: false, isAuthorized: true)
//            self?.start()
//        }
//        self.addDependency(authCoordinator)
//        authCoordinator.start()
    }
    
    private func runOnboardingFlow() {
        var onboardingModule = container.resolve(OnboardingAssembly.self)?.build()
        onboardingModule?.output.onCompleted = { [weak self] in
            print("TODO")
        }
        router.setRootModule(onboardingModule, hideBar: true)
        
        //        let coordinator = TutorialCoordinator(router: self.router)
        //        coordinator.finishFlow = { [weak self, weak coordinator] in
        //            self?.removeDependency(coordinator)
        //            self?.launchInstructor = LaunchInstructor.configure(tutorialWasShown: true, isAuthorized: true)
        //            self?.start()
        //        }
        //        self.addDependency(coordinator)
        //        coordinator.start()
    }
    
    private func runMainFlow() {
        //        let coordinator = MainCoordinator(router: self.router)
        //        coordinator.finishFlow = { [weak self, weak coordinator] in
        //            self?.removeDependency(coordinator)
        //            self?.launchInstructor = LaunchInstructor.configure(tutorialWasShown: false, isAuthorized: false)
        //            self?.start()
        //        }
        //        self.addDependency(coordinator)
        //        coordinator.start()
    }
}
