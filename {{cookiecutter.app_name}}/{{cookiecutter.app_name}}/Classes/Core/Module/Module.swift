//
//  Module.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

struct Module<Input, Output>: Presentable {
    
    var view: UIViewController
    var input: Input
    var output: Output
    
    func toPresent() -> UIViewController? {
        return view
    }
    
}
