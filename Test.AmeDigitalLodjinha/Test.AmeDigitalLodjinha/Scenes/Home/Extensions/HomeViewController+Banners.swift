//
//  HomeViewController+Banners.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 18/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController {
    
    func displayBannersLoading() {
        let container: UIView = UIView()
        container.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 200)
        container.backgroundColor = Constants.mainColor
        
        let activityView = UIActivityIndicatorView(style: .whiteLarge)
        activityView.center = container.center
        activityView.startAnimating()
        container.addSubview(activityView)
        
        self.setupTableViewHeader(contentView: container)
    }
    
    func displayBanners(viewModel: Home.Banner.ViewModel) {
        let sliderView = BannersSliderView(
            imagesUrl: viewModel.banners.map { $0.photo },
            adressesUrl: viewModel.banners.map { $0.url })
        self.setupTableViewHeader(contentView: sliderView)
    }
    
    func displayBannersError(_ error: Error) {
        let container: UIView = UIView()
        container.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 200)
        container.backgroundColor = Constants.mainColor
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 200))
        label.center = container.center
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Erro ao carregar banners."
        container.addSubview(label)
        
        self.setupTableViewHeader(contentView: container)
    }
    
}
