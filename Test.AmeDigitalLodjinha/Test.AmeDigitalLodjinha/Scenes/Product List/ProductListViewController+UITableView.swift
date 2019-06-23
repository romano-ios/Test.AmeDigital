//
//  ProductListViewController+UITableView.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 22/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = interactor?.cellForRow(at: indexPath.row) else { fatalError("Nullable Interactor.") }
        return ProductTableViewCellSetup.setup(tableView: tableView, indexPath: indexPath, viewModel: viewModel)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor?.didSelect(at: indexPath.row)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let endScrolling: CGFloat = scrollView.contentOffset.y + scrollView.frame.size.height
        
        if endScrolling >= scrollView.contentSize.height {
            interactor?.requestProductsByCategory()
        }
    }
    
}
