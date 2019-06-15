//
//  LodjinhaUtils.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 14/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

struct LodjinhaUtils {
    
    static func getProductDetailsUrlBy(id: Int) -> String {
        return "\(Constants.apiProductUrl)/\(id)"
    }
    
}
