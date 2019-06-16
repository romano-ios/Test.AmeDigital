//
//  Banner.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 15/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

class BannerModel: Codable {
    
    let id: Int
    let linkUrl: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case linkUrl
        case imageUrl = "urlImagem"
    }
    
}
