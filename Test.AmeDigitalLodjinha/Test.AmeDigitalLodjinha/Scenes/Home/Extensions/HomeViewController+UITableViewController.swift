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
    
    func setupTableViewHeader(contentView: UIView) {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Test"
        return cell
    }
    
}
