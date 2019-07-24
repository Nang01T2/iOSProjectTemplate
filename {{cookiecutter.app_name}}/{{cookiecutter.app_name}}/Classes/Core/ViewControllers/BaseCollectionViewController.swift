//
//  BaseCollectionViewController.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.author}} on {{cookiecutter.date}}.
//  Copyright © 2019 {{cookiecutter.organization}}. All rights reserved.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {
    var items = [CellModelType]()
    
    let loadingView = LoadingView()
    let noConnectionView = NoConnectionView()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = .darkGray
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = .white
        collectionView?.addSubview(self.refreshControl)
        
        view.addSubview(loadingView)
        loadingView.fillSuperView()
        loadingView.isHidden = true
        
        view.addSubview(noConnectionView)
        noConnectionView.delegate = self
        noConnectionView.fillSuperView()
        noConnectionView.isHidden = true
    }
    
    @objc func handleRefresh() {
        pullToRefresh()
    }
    
    func updateLoading(_ show: Bool) {
        if refreshControl.isRefreshing {
            if !show {
                self.refreshControl.endRefreshing()
            }
            return
        }
        loadingView.isHidden = !show
    }
    
    func showMessage(_ message: String) {
//        let messageAlert = MessageAlert(message)
//        let alertController = messageAlert.alertController
//
//        self.present(alertController, animated: true, completion: nil)
    }
    
    func updateNoConnection(_ show: Bool) {
        noConnectionView.isHidden = !show
    }
    
    func pullToRefresh() {
        
    }
    
    func didClickItem(_ model: CellModelType) {
        
    }
    
    func willLoadMore() {
        
    }
    
    func willRetry() {
        
    }
}

// MARK: - UICollectionViewDelegate
extension BaseCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = items[indexPath.row]
        
        didClickItem(model)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == self.items.count - 1 && !self.items.isEmpty {
            willLoadMore()
        }
        
        let model = items[indexPath.row]
        // swiftlint:disable force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.cellIdentifier,
                                                      for: indexPath) as! BaseCollectionCell
        cell.model = model
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BaseCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let model = items[indexPath.row]
        let height = CGFloat(model.cellHeight)
        
        return CGSize(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

// MARK: - NoConnectionViewDelegate
extension BaseCollectionViewController: NoConnectionViewDelegate {
    
    func didClickRetry() {
        willRetry()
    }
    
}
