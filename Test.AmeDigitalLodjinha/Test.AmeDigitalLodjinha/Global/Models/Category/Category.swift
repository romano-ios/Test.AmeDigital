//
//  Category.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 19/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

class CategoryModel: Codable {
    
    let id: Int
    let description: String
    let imageUrl: String
    
    init(id: Int, description: String, imageUrl: String) {
        self.id = id
        self.description = description
        self.imageUrl = imageUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case description = "descricao"
        case imageUrl = "urlImagem"
    }
    
}
