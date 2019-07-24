//
//  SearchBar.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

public class SearchBar: UISearchBar, UISearchBarDelegate {
    
    /// Throttle engine
    private var throttler: Throttler?
    
    /// Throttling interval
    public var throttlingInterval: Double? = 0 {
        didSet {
            guard let interval = throttlingInterval else {
                self.throttler = nil
                return
            }
            self.throttler = Throttler(interval: interval)
        }
    }
    
    public var searchBarIsActive = false
    
    /// Event received when cancel is pressed
    public var onCancel: (() -> Void)?
    
    /// Event received when a change into the search box is occurred
    public var onTextDidChange: ((String) -> Void)?
    
    public var onSearch: ((String) -> Void)?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Events for UISearchBarDelegate
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBarIsActive = true
        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.sizeToFit()
    }
    
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBarIsActive = false
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.onCancel?()
        searchBar.resignFirstResponder()
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.onSearch?(self.text ?? "")
        searchBar.resignFirstResponder()
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let throttler = self.throttler else {
            self.onTextDidChange?(searchText)
            return
        }
        throttler.throttle {
            DispatchQueue.main.async {
                self.onTextDidChange?(self.text ?? "")
            }
        }
    }
    
}
