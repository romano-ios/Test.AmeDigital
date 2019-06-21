//
//  ReserveProductButton.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 20/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

class ReserveProductButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Wrong implementation.")
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor =
                isHighlighted
                ? UIColor(red: 69/255, green: 30/255, blue: 96/255, alpha: 1.0)
                : UIColor(red: 94/255, green: 42/255, blue: 131/255, alpha: 1.0)
        }
    }
    
    private func setup() {
        self.backgroundColor = UIColor(red: 94/255, green: 42/255, blue: 131/255, alpha: 1.0)
        self.setTitle("Reservar", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        self.layer.cornerRadius = 6
    }
    
}
