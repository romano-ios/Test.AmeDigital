//
//  CategoryViewModel.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 19/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

struct CategoryViewModel {
    
    let id: Int
    let description: String
    let imageUrl: String
    
    init(category: CategoryModel) {
        self.id = category.id
        self.description = category.description
        self.imageUrl = category.imageUrl
    }
    
}
