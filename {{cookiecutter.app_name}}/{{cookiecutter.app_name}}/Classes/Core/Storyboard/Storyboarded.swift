//
//  Storyboarded.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

public protocol Storyboarded {
    static func instantiate(fromStoryboard filename: String, at bundle: Bundle) -> Self
}

public extension Storyboarded where Self: UIViewController {
    static func instantiate(fromStoryboard filename: String = "Main", at bundle: Bundle = Bundle.main) -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // load our storyboard
        let storyboard = UIStoryboard(name: filename, bundle: bundle)

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        // swiftlint:disable force_cast
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
