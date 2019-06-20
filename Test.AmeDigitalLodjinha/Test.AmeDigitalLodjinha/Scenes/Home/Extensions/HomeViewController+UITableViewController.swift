//
//  HomeViewController+UITableViewController.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 17/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isCategoriesSection(indexPath.section) { return 120 }
        return UITableView.automaticDimension
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 7 }
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if isCategoriesSection(section) { return CellsUtils.generateSectionHeader(title: Constants.titleCategories) }
        if isBestSellersSection(section) { return CellsUtils.generateSectionHeader(title: Constants.titleBestSellers) }
        return UIView(frame: CGRect.zero)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isCategoriesSection(section) { return 1 }
        if isBestSellersSection(section) { return interactor?.numberOfBestSellerRows ?? 0 }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isCategoriesSection(indexPath.section) {
            if let viewModel = interactor?.cellForCategories() {
                return CategoryTableViewCellSetup.setup(tableView: tableView, indexPath: indexPath, viewModel: viewModel)
            }
        }
        
        if isBestSellersSection(indexPath.section) {
            if let viewModel = interactor?.cellForBestSellerRow(at: indexPath.row) {
                return ProductTableViewCellSetup.setup(tableView: tableView, indexPath: indexPath, viewModel: viewModel)
            }
        }
        
        return tableView.dequeueReusableCell(withIdentifier: CellsIdentifiers.cell.rawValue, for: indexPath)
    }
    
    func setupTableViewHeader(contentView: UIView) {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowOffset = CGSize(width: 1, height: 3)
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.6
        containerView.addSubview(contentView)
        
        self.tableView.tableHeaderView = containerView
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.tableView.topAnchor),
            containerView.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor),
            containerView.widthAnchor.constraint(equalTo: self.tableView.widthAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 200)
            ])
        
        self.tableView.tableHeaderView?.layoutIfNeeded()
        self.tableView.tableHeaderView = self.tableView.tableHeaderView
    }
    
    private func isCategoriesSection(_ section: Int) -> Bool {
        if section == 1 { return true }
        return false
    }
    
    private func isBestSellersSection(_ section: Int) -> Bool {
        if section == 2 { return true }
        return false
    }
    
}
