//
//  Drink.swift
//  MoCocktail
//
//  Created by Admin on 19/09/22.
//

import Foundation

struct ListOfDrink: Codable {
    let drinks: [Drink]
}
struct Drink : Codable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}



struct ListOfCategories: Codable {
    let drinks: [Category]
}

// MARK: - Category
struct Category : Codable{
    let strCategory: String
}
