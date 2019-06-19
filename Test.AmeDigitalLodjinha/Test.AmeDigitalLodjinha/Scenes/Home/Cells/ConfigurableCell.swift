//
//  ConfigurableCell.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 18/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    
    associatedtype T
    
    static func setup(tableView: UITableView, indexPath: IndexPath, viewModel: T) -> UITableViewCell
    
}
