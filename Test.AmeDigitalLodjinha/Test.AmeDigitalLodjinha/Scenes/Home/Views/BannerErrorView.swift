//
//  BannerErrorView.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 23/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

class BannerErrorView: UIView {

    private let width: CGFloat
    private let height: CGFloat
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.width = 0.0
        self.height = 0.0
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let container: UIView = UIView()
        container.frame = CGRect(x: 0, y: 0, width: width, height: height)
        container.backgroundColor = Constants.mainColor
        addSubview(container)

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        label.center = container.center
        label.textColor = .white
        label.textAlignment = .center
        label.text = R.string.home.error_loading_banners()
        container.addSubview(label)
    }
    
}
