//
//  Constants.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 14/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    static let mainColor = UIColor(red: 106/255, green: 61/255, blue: 145/255, alpha: 1.0)
    
    static let apiHostUrl = "alodjinha.herokuapp.com"
    
    static let apiBannerUrl = "/banner"
    static let apiCategoryUrl = "/categoria"
    
    static let apiProductUrl = "/produto"
    static let apiBestSellersProductsUrl = "/produto/maisvendidos"
    
    static let httpHeaderKeyContentType = "Content-Type"
    static let httpHeaderKeyAccept = "Accept"
    static let httpHeaderValueApplicationJson = "application/json"
    
    static let titleCategories = "Categorias"
    static let titleBestSellers = "Mais Vendidos"
    
    static let reserveSuccessTitle = "Sucesso!"
    static let reserveSuccessMessage = "O seu produto foi reservado com sucesso."
    static let reserveErrorTitle = "Erro"
    static let reserveErrorMessage = "Não foi possível reservar o produto. Tente novamente."
    static let reserveCloseActionMessage = "Fechar"
    
    static let productListErrorTitle = "Erro"
    static let productListErrorMessage = "Erro"
    static let productListErrorCloseActionMessage = "Fechar"
    
}
