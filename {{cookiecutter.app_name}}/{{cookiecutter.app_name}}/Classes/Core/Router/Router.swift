//
//  Router.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

final public class Router: NSObject, Presentable {
    
    // MARK: - Vars & Lets
    
    private weak var rootController: UINavigationController?
    private var completions: [UIViewController : () -> Void]
    private var transition: UIViewControllerAnimatedTransitioning?
    
    // MARK: - Init methods
    
    public init(rootController: UINavigationController) {
        self.rootController = rootController
        self.completions = [:]
        super.init()
        self.rootController?.delegate = self
    }
    
    // MARK: - Presentable
    
    public func toPresent() -> UIViewController? {
        return self.rootController
    }
    
    // MARK: - RouterProtocol
    
    public func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    public func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        self.rootController?.present(controller, animated: animated, completion: nil)
    }
    
    public func push(_ module: Presentable?)  {
        self.push(module, transition: nil)
    }
    
    public func push(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?) {
        self.push(module, transition: transition, animated: true)
    }
    
    public func push(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?, animated: Bool)  {
        self.push(module, transition: transition, animated: animated, completion: nil)
    }
    
    public func push(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?, animated: Bool, completion: (() -> Void)?) {
        self.transition = transition
        guard let controller = module?.toPresent(),
            (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
        if let completion = completion {
            self.completions[controller] = completion
        }
        self.rootController?.pushViewController(controller, animated: animated)
    }
    
    public func popModule()  {
        self.popModule(transition: nil)
    }
    
    public func popModule(transition: UIViewControllerAnimatedTransitioning?) {
        self.popModule(transition: transition, animated: true)
    }
    
    public func popModule(transition: UIViewControllerAnimatedTransitioning?, animated: Bool) {
        self.transition = transition
        if let controller = rootController?.popViewController(animated: animated) {
            self.runCompletion(for: controller)
        }
    }
    
    public func popToModule(module: Presentable?, animated: Bool) {
        if let controllers = self.rootController?.viewControllers , let module = module {
            for controller in controllers {
                if controller == module as! UIViewController {
                    self.rootController?.popToViewController(controller, animated: animated)
                    break
                }
            }
        }
    }
    
    public func dismissModule() {
        self.dismissModule(animated: true, completion: nil)
    }
    
    public func dismissModule(animated: Bool, completion: (() -> Void)?) {
        self.rootController?.dismiss(animated: animated, completion: completion)
    }
    
    public func setRootModule(_ module: Presentable?) {
        self.setRootModule(module, hideBar: false)
    }
    
    public func setRootModule(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?) {
        self.setRootModule(module, transition: transition, hideBar: false)
    }
    
    public func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        self.rootController?.setViewControllers([controller], animated: false)
        self.rootController?.isNavigationBarHidden = hideBar
    }
    
    public func setRootModule(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        self.transition = transition
        self.rootController?.setViewControllers([controller], animated: true)
        self.rootController?.isNavigationBarHidden = hideBar
    }
    
    public func popToRootModule(animated: Bool) {
        if let controllers = self.rootController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                self.runCompletion(for: controller)
            }
        }
    }
    
    // MARK: - Private methods
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = self.completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}

extension Router: UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController,
                                     animationControllerFor operation: UINavigationController.Operation,
                                     from fromVC: UIViewController,
                                     to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transition
    }
    
    public func navigationController(_ navigationController: UINavigationController,
                                     didShow viewController: UIViewController, animated: Bool) {
        
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(poppedViewController) else {
                return
        }
        
        runCompletion(for: poppedViewController)
    }
    
}
