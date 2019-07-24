//
//  UIView+anchors.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

// swiftlint:disable all
extension UIView {
    func fillSuperView() {
        guard let superview = self.superview else {
            return
        }
        
        anchor(top: superview.topAnchor,
               left: superview.leftAnchor,
               bottom: superview.bottomAnchor,
               right: superview.rightAnchor,
               paddingTop: 0,
               paddingLeft: 0,
               paddingBottom: 0,
               paddingRight: 0,
               width: 0,
               height: 0)
    }
    
    func centerSuperView(width: Float, height: Float) {
        guard let superview = self.superview else {
            return
        }
        
        anchor(centerX: superview.centerXAnchor,
               centerY: superview.centerYAnchor,
               paddingCenterX: 0,
               paddingCenterY: 0,
               width: width,
               height: height)
    }
    
    func anchor(centerX: NSLayoutXAxisAnchor?,
                centerY: NSLayoutYAxisAnchor?,
                paddingCenterX: Float,
                paddingCenterY: Float,
                width: Float,
                height: Float) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX, constant: CGFloat(paddingCenterX)).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY, constant: CGFloat(paddingCenterY)).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        }
    }
    
    func anchor(top: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                right: NSLayoutXAxisAnchor?,
                paddingTop: Float,
                paddingLeft: Float,
                paddingBottom: Float,
                paddingRight: Float,
                width: Float,
                height: Float) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: CGFloat(paddingTop)).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: CGFloat(paddingLeft)).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: CGFloat(-paddingBottom)).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: CGFloat(-paddingRight)).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        }
    }
}
