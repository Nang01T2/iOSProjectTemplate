//
//  Coordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    func start()
    func start(with option: DeepLinkOption?)
}
