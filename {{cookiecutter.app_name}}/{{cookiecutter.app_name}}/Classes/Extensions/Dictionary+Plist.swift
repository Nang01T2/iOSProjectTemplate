//
//  Dictionary+Plist.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

extension Dictionary where Key == String {
    
    /// Initializes a dictionary from `.plist` file.
    ///
    /// - Parameter from: The `.plist` file path.
    init(from path: String) {
        
        guard let data = FileManager.default.contents(atPath: path) else {
            fatalError("File doesn't exist.")
        }
        
        guard
            let list = try? PropertyListSerialization.propertyList(from: data,
                                                                   options: PropertyListSerialization.ReadOptions(),
                                                                   format: nil),
            let dictionary = list as? [Key: Value]
            else {
                fatalError("Dictionary doesn't exist.")
        }
        
        self = dictionary
    }
    
}
