//
//  CategoryTableViewCell.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 19/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories: [CategoryViewModel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(
            UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil),
            forCellWithReuseIdentifier: CellsIdentifiers.categoryCollectionCell.rawValue
        )
    }
    
}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 115)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CellsIdentifiers.categoryCollectionCell.rawValue,
            for: indexPath) as! CategoryCollectionViewCell
        let viewModel = categories[indexPath.row]
        
        cell.categoryLabelName?.text = viewModel.description
        cell.categoryImageView.sd_setImage(with: URL(string: viewModel.imageUrl), placeholderImage: UIImage(named: "noProductPlaceholder"))
        
        return cell
    }
    
}
