//
//  Coordinator.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

protocol CoordinatorType: AnyObject {
    var identifier: UUID { get }
    
    func start()
    func start(with option: DeepLinkOption?)
}
