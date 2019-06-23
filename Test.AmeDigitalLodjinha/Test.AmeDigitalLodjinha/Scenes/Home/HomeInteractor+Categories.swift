//
//  HomeInteractor+Categories.swift
//  Test.AmeDigitalLodjinha
//
//  Created by Leandro Romano on 23/06/19.
//  Copyright © 2019 Leandro Romano. All rights reserved.
//

import Foundation

extension HomeInteractor {
    
    func requestCategories() {
        worker?.getCategories().done(handleGetCategoriesSuccess).catch(handleGetCategoriesError)
    }
    
    func handleGetCategoriesSuccess(_ response: Home.Category.Response) {
        self.categories = response.data
        presenter?.presentDynamicData()
    }
    
    func handleGetCategoriesError(_ error: Error) {
        presenter?.presentGenericError(errorMessage: R.string.home.error_loading_categories())
    }
    
    func cellForCategories() -> [CategoryViewModel] {
        return self.categories.map { CategoryViewModel(category: $0) }
    }
    
    func didSelectCategory(at index: Int) {
        category = categories[index]
        presenter?.presentProductsListByCategory()
    }
    
}
