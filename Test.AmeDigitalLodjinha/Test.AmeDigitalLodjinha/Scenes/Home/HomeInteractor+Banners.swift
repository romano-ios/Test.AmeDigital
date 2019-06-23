//
//  HomeInteractor+Banners.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 23/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

extension HomeInteractor {
    
    func setupBannersContentLoading() {
        presenter?.presentBannersLoading()
    }
    
    func requestBannersContent() {
        worker?.getBanners().done(handleGetBannersSuccess).catch(handleGetBannersError)
    }
    
    func handleGetBannersSuccess(_ response: Home.Banner.Response) {
        presenter?.presentBanners(response: response)
    }
    
    func handleGetBannersError(_ error: Error) {
        presenter?.presentBannersError()
    }
    
}
