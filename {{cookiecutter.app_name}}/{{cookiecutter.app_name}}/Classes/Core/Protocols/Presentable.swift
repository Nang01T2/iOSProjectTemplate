//
//  Presentable.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

public protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    public func toPresent() -> UIViewController? {
        return self
    }
}
