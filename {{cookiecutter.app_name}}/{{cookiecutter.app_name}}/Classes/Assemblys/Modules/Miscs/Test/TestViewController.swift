//
//  TestViewController.swift
//  {{cookiecutter.app_name}}
//
//  Created by Nang Nguyen on 7/16/19
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, Storyboarded, TestModuleOutput {
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
        
        title = "Test"
        //tabBarItem = UITabBarItem(title: "Movies", image: #imageLiteral(resourceName: "list_icon"), tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Module Input
extension TestViewController: TestModuleInput {
    
}

// MARK: Button Action
extension TestViewController {
    
}
