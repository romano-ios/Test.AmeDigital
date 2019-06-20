//
//  ProductTableViewCellSetup.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 18/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation
import UIKit

struct ProductTableViewCellSetup: ConfigurableCell {

    typealias T = ProductViewModel
    
    static func setup(tableView: UITableView, indexPath: IndexPath, viewModel: ProductViewModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsIdentifiers.productCell.rawValue, for: indexPath) as! ProductTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.productNameLabel.text = viewModel.name
        cell.productImageView.sd_setImage(with: URL(string: viewModel.imageUrl), placeholderImage: UIImage(named: "noProductPlaceholder"))
        cell.productOldPriceLabel.text = "De: \(LodjinhaUtils.convertMoneyToString(viewModel.oldPrice))"
        cell.productCurrentPriceLabel.text = "Por: \(LodjinhaUtils.convertMoneyToString(viewModel.currentPrice))"
        
        return cell
    }
    
}
