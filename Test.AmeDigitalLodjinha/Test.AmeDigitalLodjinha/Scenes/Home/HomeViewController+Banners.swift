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
    
    func displayBanners(viewModel: Home.Banner.ViewModel) {
        let sliderView = BannerSliderView(
            imagesUrl: viewModel.banners.map { $0.photo },
            adressesUrl: viewModel.banners.map { $0.url })
        setupTableViewHeader(contentView: sliderView)
    }
    
    func displayBannersLoading() {
        let loadingView = BannerLoadingView(width: tableView.frame.width, height: 200)
        setupTableViewHeader(contentView: loadingView)
    }
    
    func displayBannersError() {
        let errorView = BannerErrorView(width: tableView.frame.width, height: 200)
        setupTableViewHeader(contentView: errorView)
    }
    
}
