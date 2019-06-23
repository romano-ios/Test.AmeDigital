//
//  Double+Money.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 23/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

extension Double {
    
    var toMoney: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        if let money = formatter.string(from: NSNumber(value: self)) { return money }
        return ""
    }
    
}
