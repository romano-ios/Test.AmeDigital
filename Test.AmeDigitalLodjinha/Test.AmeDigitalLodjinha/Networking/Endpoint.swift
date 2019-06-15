//
//  Endpoint.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 14/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

struct Endpoint {
    
    let path: String
    let queryItems: [URLQueryItem]
    
}

extension Endpoint {
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = Constants.apiHostUrl
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
    
}
