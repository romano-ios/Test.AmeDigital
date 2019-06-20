//
//  CellsUtils.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 18/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation
import UIKit

struct CellsUtils {
    
    static func generateSectionHeader(title: String) -> UIView {
        let sectionView = UIView()
        sectionView.backgroundColor = .white
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = title
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .darkGray
        sectionView.addSubview(label)
        
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .groupTableViewBackground
        sectionView.addSubview(separator)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: sectionView.topAnchor),
            label.leftAnchor.constraint(equalTo: sectionView.leftAnchor, constant: 16),
            label.rightAnchor.constraint(equalTo: sectionView.rightAnchor),
            label.bottomAnchor.constraint(equalTo: sectionView.bottomAnchor),
            
            separator.topAnchor.constraint(equalTo: sectionView.bottomAnchor),
            separator.widthAnchor.constraint(equalTo: sectionView.widthAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.centerXAnchor.constraint(equalTo: sectionView.centerXAnchor)
        ])
        
        return sectionView
    }
    
}
