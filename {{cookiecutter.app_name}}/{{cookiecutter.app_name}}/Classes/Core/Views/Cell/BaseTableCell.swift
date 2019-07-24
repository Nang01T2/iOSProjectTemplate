//
//  BaseTableCell.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class BaseTableCell: UITableViewCell, CellType {
    
    var model: CellModelType? {
        didSet {
            setupViews()
            updateViews()
        }
    }
    
    func setupViews() {
        
    }
    
    func updateViews() {
        
    }
}
