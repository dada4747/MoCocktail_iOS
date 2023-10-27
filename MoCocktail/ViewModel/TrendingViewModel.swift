//
//  TrendingViewModel.swift
//  MoCocktail
//
//  Created by Admin on 22/09/22.
//

import Foundation
class TrendingViewModel{
    var reloadList = {() -> () in}
    var errorMessage = {(message : String) -> () in}
    var arrayOfList : [Drink] = []{
        didSet{
            reloadList()
        }
    }
    func getListData() {
        service.shared.getTrendingDrinks{ result in
            switch result {
            case .success(let drinks):
                self.arrayOfList = drinks
            case .failure(let err):
                print(err)
            }
        }
    }
}


class RecipeDetailViewModel{
    var recipeDetail : Recipe? {
        didSet{
            reloadDetail()
        }
    }
    var reloadDetail = {() -> () in}


    func getRecepiDetail(id: String){
        service.shared.getCocktailDetails(with: id) { result in
            switch result{
            case .success(let drinks):
                print(drinks)
                self.recipeDetail = drinks
            case .failure(let err):
                print(err)
            }
        }
    }
}
