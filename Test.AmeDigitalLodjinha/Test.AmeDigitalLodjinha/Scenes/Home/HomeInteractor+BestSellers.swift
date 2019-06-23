//
//  HomeInteractor+BestSellers.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 23/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

extension HomeInteractor {
    
    var numberOfBestSellerRows: Int {
        return self.bestSellers.count
    }
    
    func requestBestSellers() {
        worker?.getBestSellers().done(handleGetBestSellersSuccess).catch(handleGetBestSellersError)
    }
    
    func handleGetBestSellersSuccess(_ response: Home.BestSeller.Response) {
        self.bestSellers = response.data
        presenter?.presentDynamicData()
    }
    
    func handleGetBestSellersError(_ error: Error) {
        presenter?.presentGenericError(errorMessage: R.string.home.error_loading_best_sellers())
    }
    
    func cellForBestSellerRow(at index: Int) -> ProductViewModel {
        let bestSeller = self.bestSellers[index]
        return ProductViewModel(product: bestSeller)
    }
    
    func didSelectBestSeller(at index: Int) {
        product = bestSellers[index]
        presenter?.presentBestSellerDetails()
    }
    
}
