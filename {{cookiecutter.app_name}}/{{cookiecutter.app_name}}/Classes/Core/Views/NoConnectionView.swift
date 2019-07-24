//
//  NoConnectionView.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

protocol NoConnectionViewDelegate: class {
    func didClickRetry()
}

class NoConnectionView: UIView {
    
    weak var delegate: NoConnectionViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupViews()
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "No internet connection\nCheck connection and repeat"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.isUserInteractionEnabled = false
        return label
    }()
    
    lazy var retryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Retry", for: .normal)
        
        button.addTarget(self, action: #selector(handleRetry), for: .touchUpInside)
        return button
    }()
    
    @objc func handleRetry() {
        delegate?.didClickRetry()
    }
    
    fileprivate func setupViews() {
        backgroundColor = .white
        
        addSubview(retryButton)
        addSubview(titleLabel)
        
        retryButton.centerSuperView(width: 200, height: 50)
        
        titleLabel.anchor(top: nil,
                          left: leftAnchor,
                          bottom: retryButton.topAnchor,
                          right: rightAnchor,
                          paddingTop: 0,
                          paddingLeft: 30,
                          paddingBottom: 30,
                          paddingRight: 30,
                          width: 0,
                          height: 40)
    }
}
