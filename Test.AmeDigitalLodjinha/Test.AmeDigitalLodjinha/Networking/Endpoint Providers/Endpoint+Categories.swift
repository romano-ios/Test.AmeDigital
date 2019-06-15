//
//  Endpoint+Categories.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 15/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

extension Endpoint {
    
    static func getCategories() -> Endpoint {
        return Endpoint(
            path: Constants.apiCategoryUrl,
            method: .get,
            queryItems: []
        )
    }
    
}
