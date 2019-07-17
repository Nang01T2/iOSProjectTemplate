//
//  DebugViewController.swift
//  {{cookiecutter.app_name}}
//
//  Created by Nang Nguyen on 7/16/19
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class DebugViewController: UIViewController, Storyboarded, DebugModuleOutput {
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Debug"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: Module Input
extension DebugViewController: DebugModuleInput {
    
}

// MARK: Button Action
extension DebugViewController {
    
}
