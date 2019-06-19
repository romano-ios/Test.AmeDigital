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
    
    static func convertMoneyToString(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        if let money = formatter.string(from: NSNumber(value: value)) { return money }
        return ""
    }
    
}
