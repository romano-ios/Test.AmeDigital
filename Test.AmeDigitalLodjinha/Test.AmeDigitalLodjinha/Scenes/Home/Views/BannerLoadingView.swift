//
//  BannerLoadingView.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 22/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

class BannerLoadingView: UIView {

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
    
        let activityView = UIActivityIndicatorView(style: .whiteLarge)
        activityView.center = container.center
        activityView.startAnimating()
        container.addSubview(activityView)
    }

}
