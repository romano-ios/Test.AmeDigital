//
//  Endpoint+Products.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 15/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

extension Endpoint {
    
    static func getProducts(offset: Int, limit: Int, categoryId: Int) -> Endpoint {
        return Endpoint(
            path: Constants.apiProductUrl,
            method: .get,
            queryItems: [
                URLQueryItem(name: "offset", value: String(offset)),
                URLQueryItem(name: "limit", value: String(limit)),
                URLQueryItem(name: "categoriaId", value: String(categoryId))
            ]
        )
    }
    
    static func getBestSellerProducts() -> Endpoint {
        return Endpoint(
            path: Constants.apiBestSellersProductsUrl,
            method: .get,
            queryItems: []
        )
    }
    
    static func getProductDetailsBy(id productId: Int) -> Endpoint {
        return Endpoint(
            path: LodjinhaUtils.getProductDetailsUrlBy(id: productId),
            method: .get,
            queryItems: []
        )
    }
    
    static func reserveProductBy(id productId: Int) -> Endpoint {
        return Endpoint(
            path: LodjinhaUtils.getProductDetailsUrlBy(id: productId),
            method: .post,
            queryItems: []
        )
    }
    
}
