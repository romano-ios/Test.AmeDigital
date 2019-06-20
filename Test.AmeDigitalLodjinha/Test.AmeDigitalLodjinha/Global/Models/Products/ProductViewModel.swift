//
//  BestSellerViewModel.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 18/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

struct ProductViewModel {
    
    let id: Int
    let name: String
    let imageUrl: String
    let oldPrice: Double
    let currentPrice: Double
    
    init(product: ProductModel) {
        self.id = product.id
        self.name = product.name
        self.imageUrl = product.imageUrl
        self.oldPrice = product.oldPrice
        self.currentPrice = product.currentPrice
    }
    
}
