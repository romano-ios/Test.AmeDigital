//
//  Endpoint+Banner.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 15/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

extension Endpoint {
    
    static func getBanners() -> Endpoint {
        return Endpoint(
            path: Constants.apiBannerUrl,
            method: .get,
            queryItems: []
        )
    }
    
}
