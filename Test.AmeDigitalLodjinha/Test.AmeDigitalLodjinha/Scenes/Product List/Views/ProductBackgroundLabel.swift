//
//  ProductBackgroundLabel.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 22/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

class ProductBackgroundLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        textColor = .darkGray
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        numberOfLines = 0
    }
    
}
