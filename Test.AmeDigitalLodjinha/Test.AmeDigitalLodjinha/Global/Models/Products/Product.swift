//
//  BestSeller.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 18/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

class ProductModel: Codable {
    
    let id: Int
    let name: String
    let imageUrl: String
    let description: String
    let oldPrice: Double
    let currentPrice: Double
    let category: CategoryModel
    
    init(id: Int, name: String, imageUrl: String, description: String, oldPrice: Double, currentPrice: Double, category: CategoryModel) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.description = description
        self.oldPrice = oldPrice
        self.currentPrice = currentPrice
        self.category = category
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case imageUrl = "urlImagem"
        case description = "descricao"
        case oldPrice = "precoDe"
        case currentPrice = "precoPor"
        case category = "categoria"
    }
    
}
