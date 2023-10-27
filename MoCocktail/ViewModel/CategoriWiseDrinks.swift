//
//  CategoriWiseDrinks.swift
//  MoCocktail
//
//  Created by Admin on 22/09/22.
//

import Foundation
class CategoriWiseDrinksViewModel{
    var reloadList = {() -> () in}
    var errorMessage = {(message : String) -> () in}
    var arrayOfList : [Drink] = []{
        didSet{
            reloadList()
        }
    }
    func getListData(category: String) {
        service.shared.getWithCategory(with: category, completion: { result in
            switch result {
            case .success(let drinks):
                self.arrayOfList = drinks
            case .failure(let err):
                print(err)
            }
        })
    }
    
}

