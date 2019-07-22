//
//  LogServiceType.swift
//  {{cookiecutter.app_name}}
//
//  Created by Nang Nguyen on 7/22/19
//	Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

protocol LogServiceType {
    func info(_ format: String, _ args: CVarArg...)
    func warning(_ format: String, _ args: CVarArg...)
    func error(_ format: String, _ args: CVarArg...)
    func debug(_ format: String, _ args: CVarArg...)
    func verbose(_ format: String, _ args: CVarArg...)
}
