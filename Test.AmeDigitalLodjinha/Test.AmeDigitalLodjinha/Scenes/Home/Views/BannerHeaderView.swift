//
//  BannerHeaderView.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 23/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

class BannerHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowOffset = CGSize(width: 1, height: 3)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.6
    }

}
