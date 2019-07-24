//
//  BaseCollectionCell.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell, CellType {
    
    var model: CellModelType? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
    }
    
    func setupViews() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
