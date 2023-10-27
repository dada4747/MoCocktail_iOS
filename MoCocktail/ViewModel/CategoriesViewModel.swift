//
//  CategoriesViewModel.swift
//  MoCocktail
//
//  Created by Admin on 22/09/22.
//

import Foundation
class CategoriesViewModel {
    var reloadList = {() -> () in}
    var errorMessage = {(message : String) -> () in}
    var arrayOfList : [Category] = []{
        didSet{
            reloadList()
        }
    }
    func getListData() {
        service.shared.getCategories{ result in
            switch result {
            case .success(let drinks):
                self.arrayOfList = drinks
            case .failure(let err):
                
                break
            }
        }
    }
    
}
