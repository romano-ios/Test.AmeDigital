//
//  CategoryTableViewCellSetup.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 20/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation
import UIKit

struct CategoryTableViewCellSetup: ConfigurableCell {
    
    typealias T = [CategoryViewModel]
    
    static func setup(tableView: UITableView, indexPath: IndexPath, viewModel: [CategoryViewModel]) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsIdentifiers.categoryCell.rawValue, for: indexPath) as! CategoryTableViewCell
        cell.categories = viewModel
        
        DispatchQueue.main.async { cell.collectionView.reloadData() }
        
        return cell
    }
    
}
