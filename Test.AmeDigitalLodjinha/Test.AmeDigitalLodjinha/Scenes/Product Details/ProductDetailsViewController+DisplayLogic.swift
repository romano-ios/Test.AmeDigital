//
//  ProductDetailsViewController+DisplayLogic.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 22/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation
import UIKit

protocol ProductDetailsDisplayLogic: class {
    func displayProductDetails(viewModel: ProductDetails.ViewModel)
    func displayReserveProductButton()
    func enableReserveProductButton()
    func disableReserveProductButton()
    func displaySuccessReserveMessage()
    func displayErrorReserveMessage(errorMessage: String)
}

extension ProductDetailsViewController: ProductDetailsDisplayLogic {
    
    func displayProductDetails(viewModel: ProductDetails.ViewModel) {
        title = viewModel.category
        productImageView.sd_setImage(with: URL(string: viewModel.imageUrl), placeholderImage: R.image.noProductPlaceholder())
        productNameLabel.text = viewModel.name
        productOldPriceLabel.attributedText = R.string.productDetails.old_price(viewModel.oldPrice.toMoney).toStrikethroughStyle
        productCurrentPriceLabel.text = R.string.productDetails.current_price(viewModel.currentPrice.toMoney)
        productDescriptionLabel.attributedText = viewModel.description.htmlToAttributedString
        productDescriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    func displayReserveProductButton() {
        guard let window = UIApplication.shared.keyWindow else { return }
        var componentHeight: CGFloat = 74
        var yPosition = window.frame.size.height - componentHeight
        
        if #available(iOS 11.0, *) {
            yPosition -= window.safeAreaInsets.bottom
            componentHeight += window.safeAreaInsets.bottom
        }
        
        let reserveProductView = ReserveProductView(frame: CGRect(x: 0, y: yPosition, width: window.frame.size.width, height: componentHeight))
        reserveProductView.reserveProductButton.addTarget(self, action: #selector(requestReserveProduct), for: .touchUpInside)
        
        self.reserveProductButton = reserveProductView.reserveProductButton
        self.view.addSubview(reserveProductView)
    }
    
    @objc func requestReserveProduct(sender: UIButton!) {
        interactor?.requestProductReserve()
    }
    
    func enableReserveProductButton() {
        self.reserveProductButton?.isEnabled = true
    }
    
    func disableReserveProductButton() {
        self.reserveProductButton?.isEnabled = false
    }
    
    func displaySuccessReserveMessage() {
        let alert = UIAlertController(
            title: R.string.productDetails.success_title(),
            message: R.string.productDetails.success_message(),
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: R.string.productDetails.close_message(), style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        
        present(alert, animated: true)
    }
    
    func displayErrorReserveMessage(errorMessage: String) {
        let alert = UIAlertController(
            title: R.string.productDetails.error_title(),
            message: R.string.productDetails.error_message(errorMessage),
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: R.string.productDetails.close_message(), style: .default))
        
        present(alert, animated: true)
    }
    
}
