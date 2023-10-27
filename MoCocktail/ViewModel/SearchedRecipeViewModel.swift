//
//  SearchedRecipeViewModel.swift
//  MoCocktail
//
//  Created by Admin on 07/10/22.
//

import Foundation

class SearchedRecipeViewModel {
    var reloadList = {() -> () in}
    var errorMessage = {(message : String) -> () in}
    var count : Int = 0
    var arrayOfList : [Recipe] = []{
        didSet{
            reloadList()
        }
    }
    func getSearchListData(searchKey: String) {
        service.shared.getSearchedResults(with: searchKey, completion: { result in
            switch result {
            case .success(let drinks):
                self.arrayOfList = drinks ?? []
                self.count = drinks?.count ?? 0
            case .failure(let err):
                print(err)
            }
        })
    }
    
}
