//
//  BannerViewModel.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 15/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

struct BannerViewModel {
    
    let id: Int
    let url: String
    let photo: String
    
    init(banner: BannerModel) {
        self.id = banner.id
        self.url = banner.linkUrl
        self.photo = banner.imageUrl
    }
    
}
