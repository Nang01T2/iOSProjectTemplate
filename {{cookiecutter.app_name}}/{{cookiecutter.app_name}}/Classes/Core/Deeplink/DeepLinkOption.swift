//
//  DeepLinkOption.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import Foundation

public enum DeepLinkOption {
    case home
    //case item(String?)
    
    static func build(with userActivity: NSUserActivity) -> DeepLinkOption? {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb else { return nil }
        guard let url = userActivity.webpageURL else { return nil }
        guard let _ = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        
        //TODOs: parse url
        return nil
    }
    
    static func build(with dict: [String: AnyObject]?) -> DeepLinkOption? {
//        guard let screen = dict?["screen"] as? String else { return nil }
//        //let itemID = dict?["item_id"] as? String
//
//        switch screen {
//        case DeepLinkConstants.home: return .home
//        //case DeepLinkConstants.item: return .item(itemID)
//        default: return nil
//        }
        //TODOs
        return nil
    }
}
