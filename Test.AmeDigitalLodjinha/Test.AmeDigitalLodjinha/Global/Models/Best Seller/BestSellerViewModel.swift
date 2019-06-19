//
//  BestSellerViewModel.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 18/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

struct BestSellerViewModel {
    
    let id: Int
    let name: String
    let imageUrl: String
    let oldPrice: Double
    let currentPrice: Double
    
    init(bestSeller: BestSellerModel) {
        self.id = bestSeller.id
        self.name = bestSeller.name
        self.imageUrl = bestSeller.imageUrl
        self.oldPrice = bestSeller.oldPrice
        self.currentPrice = bestSeller.currentPrice
    }
    
}
