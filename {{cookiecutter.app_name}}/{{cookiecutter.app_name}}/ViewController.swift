//
//  ViewController.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on 7/1/19.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Environment.apiKey)
        print(Environment.apiBaseURL.absoluteString)
    }


}

