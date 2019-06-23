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
    
    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(
            UINib(nibName: R.nib.productTableViewCell.name, bundle: nil),
            forCellReuseIdentifier: R.string.cells.product_cell()
        )
        tableView.register(
            UINib(nibName: R.nib.categoryTableViewCell.name, bundle: nil),
            forCellReuseIdentifier: R.string.cells.category_cell()
        )
    }
    
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
        if isCategoriesSection(section) { return CellsUtils.createSectionHeader(title: R.string.home.section_title_categories()) }
        if isBestSellersSection(section) { return CellsUtils.createSectionHeader(title: R.string.home.section_title_best_sellers()) }
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
                let categoriesCell = CategoryTableViewCellSetup.setup(tableView: tableView, indexPath: indexPath, viewModel: viewModel)
                if case let cell as CategoryTableViewCell = categoriesCell {
                    cell.interactor = self.interactor
                }
                return categoriesCell
            }
        }
        
        if isBestSellersSection(indexPath.section) {
            if let viewModel = interactor?.cellForBestSellerRow(at: indexPath.row) {
                return ProductTableViewCellSetup.setup(tableView: tableView, indexPath: indexPath, viewModel: viewModel)
            }
        }
        
        return tableView.dequeueReusableCell(withIdentifier: R.string.cells.cell(), for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor?.didSelectBestSeller(at: indexPath.row)
    }
    
    func setupTableViewHeader(contentView: UIView) {
        let bannerHeaderView = BannerHeaderView()
        bannerHeaderView.addSubview(contentView)
        
        self.tableView.tableHeaderView = bannerHeaderView
        
        NSLayoutConstraint.activate([
            bannerHeaderView.topAnchor.constraint(equalTo: self.tableView.topAnchor),
            bannerHeaderView.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor),
            bannerHeaderView.widthAnchor.constraint(equalTo: self.tableView.widthAnchor),
            bannerHeaderView.heightAnchor.constraint(equalToConstant: 200)
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
