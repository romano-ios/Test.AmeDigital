//
//  ReserveProductView.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 20/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import UIKit

class ReserveProductView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Wrong implementation.")
    }

    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .groupTableViewBackground
        return separatorView
    }()
    
    public lazy var reserveProductButton: ReserveProductButton = {
        let button = ReserveProductButton()
        return button
    }()
    
    private func setup() {
        self.backgroundColor = .white
        self.setupViews()
        self.setupConstraints()
    }

    private func setupViews() {
        self.addSubview(separatorView)
        self.addSubview(reserveProductButton)
    }
    
    private func setupConstraints() {
        self.setupSeparatorViewConstraints()
        self.setupReserveProductButtonConstraints()
    }
    
    private func setupSeparatorViewConstraints() {
        self.separatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: self.topAnchor),
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func setupReserveProductButtonConstraints() {
        self.reserveProductButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reserveProductButton.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 12),
            reserveProductButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            reserveProductButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            reserveProductButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
}
