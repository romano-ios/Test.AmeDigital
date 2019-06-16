//
//  BaseResponse.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 15/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

class BaseResponse<T: Codable>: Codable {
    
    let data: T
    
    init(data: T) {
        self.data = data
    }
    
}
