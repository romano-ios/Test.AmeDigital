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
        let cell = tableView.dequeueReusableCell(withIdentifier: R.string.cells.product_cell(), for: indexPath) as! ProductTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.productNameLabel.text = viewModel.name
        cell.productImageView.sd_setImage(with: URL(string: viewModel.imageUrl), placeholderImage: R.image.noProductPlaceholder())
        cell.productOldPriceLabel.attributedText = R.string.productTableViewCell.old_price(viewModel.oldPrice.toMoney).toStrikethroughStyle
        cell.productCurrentPriceLabel.text = R.string.productTableViewCell.current_price(viewModel.currentPrice.toMoney)
        
        return cell
    }
    
}
