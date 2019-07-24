//
//  UISearchBar+TextBackgroundColor.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    func setTextBackgroundColor(_ color: UIColor) {
        subviews.forEach { view in
            if let textField = view.subviews.first(where: { view in view is UITextField }) as? UITextField {
                textField.backgroundColor = color
            }
        }
    }
}
