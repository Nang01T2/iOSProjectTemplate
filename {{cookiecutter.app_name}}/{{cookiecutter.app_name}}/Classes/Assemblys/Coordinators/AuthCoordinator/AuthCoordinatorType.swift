//
//  AuthCoordinatorType.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

protocol AuthCoordinatorType: CoordinatorType, Presentable {
    var onAuthCompleted: ((String) -> Void)? { set get }
    var onAuthCanceled: (() -> Void)? { set get }
}
