//
//  Endpoint+Banner.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 15/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

extension Endpoint {
    
    static func getBanners() -> Endpoint {
        return Endpoint(
            path: R.string.networking.url_banner(),
            method: .get,
            queryItems: []
        )
    }
    
}
