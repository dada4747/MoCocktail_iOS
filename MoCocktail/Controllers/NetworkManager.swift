//
//  NetworkManager.swift
//  MoCocktail
//
//  Created by Admin on 20/09/22.
//

import Foundation
import UIKit

enum APIError: Error {
    case failedTogetData
}


class service {
    static let shared = service()
    let cache  = NSCache<NSString, UIImage>()
    let cache2 = NSCache<NSString, NSData>()

    private init() {
    }
  
    func getRecentsDrinks(completion: @escaping (Result<[Drink], Error>) -> Void) {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(ListOfDrink.self, from: data)
                completion(.success(results.drinks))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    func getTrendingDrinks(completion: @escaping (Result<[Drink], Error>) -> Void) {
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(ListOfDrink.self, from: data)
                completion(.success(results.drinks))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    func getCategories(completion: @escaping (Result<[Category], Error>) -> Void) {
        guard let url = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            print(data)
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(ListOfCategories.self, from: data)
                completion(.success(results.drinks))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    func getWithCategory(with category: String, completion: @escaping (Result<[Drink], Error>) -> Void) {
        guard let url = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=\(category)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            print(data)
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(ListOfDrink.self, from: data)
                completion(.success(results.drinks))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    func getSearchedResults(with searchKey: String, completion: @escaping (Result<[Recipe]?, Error>) -> Void) {
        guard let url = URL(string:"https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(searchKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            print(data)
//            print(_)
            print(error)
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(Json4Swift_Base.self, from: data)
                completion(.success(results.drinks))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    func getCocktailDetails(with cocktailId: String, completion: @escaping (Result<Recipe, Error>) -> Void){
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=\(cocktailId)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            print(data)
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(Json4Swift_Base.self, from: data)
                completion(.success((results.drinks?.first)!))
            }catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    func downloadImage(from urlString: String,imgcompletion: @escaping (UIImage?, Data?, String)-> Void) {
            let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey), let data = cache2.object(forKey: cacheKey) {
                
            imgcompletion(image, data as Data, "")
                
//                self.image = image
                return
            }
            
            guard let url = URL(string: urlString) else { return }
            
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                if error != nil { return }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                guard let data = data else { return }
                
                guard let image = UIImage(data: data) else { return }
                self.cache.setObject(image, forKey: cacheKey)
                self.cache2.setObject(data as NSData, forKey: cacheKey)
                imgcompletion(image, data, "")
            }
            
            task.resume()
        }
}
import Foundation
struct Json4Swift_Base : Codable {
    let drinks : [Recipe]?

    enum CodingKeys: String, CodingKey {

        case drinks = "drinks"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        drinks = try values.decodeIfPresent([Recipe].self, forKey: .drinks)
    }

}


struct Recipe : Codable {
    let idDrink : String?
    let strDrink : String?
    let strDrinkAlternate : String?
    let strTags : String?
    let strVideo : String?
    let strCategory : String?
    let strIBA : String?
    let strAlcoholic : String?
    let strGlass : String?
    let strInstructions : String?
    let strInstructionsES : String?
    let strInstructionsDE : String?
    let strInstructionsFR : String?
    let strInstructionsIT : String?
    let strInstructionsZH_HANS : String?
    let strInstructionsZH_HANT : String?
    let strDrinkThumb : String?
    let strIngredient1 : String?
    let strIngredient2 : String?
    let strIngredient3 : String?
    let strIngredient4 : String?
    let strIngredient5 : String?
    let strIngredient6 : String?
    let strIngredient7 : String?
    let strIngredient8 : String?
    let strIngredient9 : String?
    let strIngredient10 : String?
    let strIngredient11 : String?
    let strIngredient12 : String?
    let strIngredient13 : String?
    let strIngredient14 : String?
    let strIngredient15 : String?
    let strMeasure1 : String?
    let strMeasure2 : String?
    let strMeasure3 : String?
    let strMeasure4 : String?
    let strMeasure5 : String?
    let strMeasure6 : String?
    let strMeasure7 : String?
    let strMeasure8 : String?
    let strMeasure9 : String?
    let strMeasure10 : String?
    let strMeasure11 : String?
    let strMeasure12 : String?
    let strMeasure13 : String?
    let strMeasure14 : String?
    let strMeasure15 : String?
    let strImageSource : String?
    let strImageAttribution : String?
    let strCreativeCommonsConfirmed : String?
    let dateModified : String?

    enum CodingKeys: String, CodingKey {

        case idDrink = "idDrink"
        case strDrink = "strDrink"
        case strDrinkAlternate = "strDrinkAlternate"
        case strTags = "strTags"
        case strVideo = "strVideo"
        case strCategory = "strCategory"
        case strIBA = "strIBA"
        case strAlcoholic = "strAlcoholic"
        case strGlass = "strGlass"
        case strInstructions = "strInstructions"
        case strInstructionsES = "strInstructionsES"
        case strInstructionsDE = "strInstructionsDE"
        case strInstructionsFR = "strInstructionsFR"
        case strInstructionsIT = "strInstructionsIT"
        case strInstructionsZH_HANS = "strInstructionsZH-HANS"
        case strInstructionsZH_HANT = "strInstructionsZH-HANT"
        case strDrinkThumb = "strDrinkThumb"
        case strIngredient1 = "strIngredient1"
        case strIngredient2 = "strIngredient2"
        case strIngredient3 = "strIngredient3"
        case strIngredient4 = "strIngredient4"
        case strIngredient5 = "strIngredient5"
        case strIngredient6 = "strIngredient6"
        case strIngredient7 = "strIngredient7"
        case strIngredient8 = "strIngredient8"
        case strIngredient9 = "strIngredient9"
        case strIngredient10 = "strIngredient10"
        case strIngredient11 = "strIngredient11"
        case strIngredient12 = "strIngredient12"
        case strIngredient13 = "strIngredient13"
        case strIngredient14 = "strIngredient14"
        case strIngredient15 = "strIngredient15"
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case strMeasure5 = "strMeasure5"
        case strMeasure6 = "strMeasure6"
        case strMeasure7 = "strMeasure7"
        case strMeasure8 = "strMeasure8"
        case strMeasure9 = "strMeasure9"
        case strMeasure10 = "strMeasure10"
        case strMeasure11 = "strMeasure11"
        case strMeasure12 = "strMeasure12"
        case strMeasure13 = "strMeasure13"
        case strMeasure14 = "strMeasure14"
        case strMeasure15 = "strMeasure15"
        case strImageSource = "strImageSource"
        case strImageAttribution = "strImageAttribution"
        case strCreativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idDrink = try values.decodeIfPresent(String.self, forKey: .idDrink)
        strDrink = try values.decodeIfPresent(String.self, forKey: .strDrink)
        strDrinkAlternate = try values.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        strTags = try values.decodeIfPresent(String.self, forKey: .strTags)
        strVideo = try values.decodeIfPresent(String.self, forKey: .strVideo)
        strCategory = try values.decodeIfPresent(String.self, forKey: .strCategory)
        strIBA = try values.decodeIfPresent(String.self, forKey: .strIBA)
        strAlcoholic = try values.decodeIfPresent(String.self, forKey: .strAlcoholic)
        strGlass = try values.decodeIfPresent(String.self, forKey: .strGlass)
        strInstructions = try values.decodeIfPresent(String.self, forKey: .strInstructions)
        strInstructionsES = try values.decodeIfPresent(String.self, forKey: .strInstructionsES)
        strInstructionsDE = try values.decodeIfPresent(String.self, forKey: .strInstructionsDE)
        strInstructionsFR = try values.decodeIfPresent(String.self, forKey: .strInstructionsFR)
        strInstructionsIT = try values.decodeIfPresent(String.self, forKey: .strInstructionsIT)
        strInstructionsZH_HANS = try values.decodeIfPresent(String.self, forKey: .strInstructionsZH_HANS)
        strInstructionsZH_HANT = try values.decodeIfPresent(String.self, forKey: .strInstructionsZH_HANT)
        strDrinkThumb = try values.decodeIfPresent(String.self, forKey: .strDrinkThumb)
        strIngredient1 = try values.decodeIfPresent(String.self, forKey: .strIngredient1)
        strIngredient2 = try values.decodeIfPresent(String.self, forKey: .strIngredient2)
        strIngredient3 = try values.decodeIfPresent(String.self, forKey: .strIngredient3)
        strIngredient4 = try values.decodeIfPresent(String.self, forKey: .strIngredient4)
        strIngredient5 = try values.decodeIfPresent(String.self, forKey: .strIngredient5)
        strIngredient6 = try values.decodeIfPresent(String.self, forKey: .strIngredient6)
        strIngredient7 = try values.decodeIfPresent(String.self, forKey: .strIngredient7)
        strIngredient8 = try values.decodeIfPresent(String.self, forKey: .strIngredient8)
        strIngredient9 = try values.decodeIfPresent(String.self, forKey: .strIngredient9)
        strIngredient10 = try values.decodeIfPresent(String.self, forKey: .strIngredient10)
        strIngredient11 = try values.decodeIfPresent(String.self, forKey: .strIngredient11)
        strIngredient12 = try values.decodeIfPresent(String.self, forKey: .strIngredient12)
        strIngredient13 = try values.decodeIfPresent(String.self, forKey: .strIngredient13)
        strIngredient14 = try values.decodeIfPresent(String.self, forKey: .strIngredient14)
        strIngredient15 = try values.decodeIfPresent(String.self, forKey: .strIngredient15)
        strMeasure1 = try values.decodeIfPresent(String.self, forKey: .strMeasure1)
        strMeasure2 = try values.decodeIfPresent(String.self, forKey: .strMeasure2)
        strMeasure3 = try values.decodeIfPresent(String.self, forKey: .strMeasure3)
        strMeasure4 = try values.decodeIfPresent(String.self, forKey: .strMeasure4)
        strMeasure5 = try values.decodeIfPresent(String.self, forKey: .strMeasure5)
        strMeasure6 = try values.decodeIfPresent(String.self, forKey: .strMeasure6)
        strMeasure7 = try values.decodeIfPresent(String.self, forKey: .strMeasure7)
        strMeasure8 = try values.decodeIfPresent(String.self, forKey: .strMeasure8)
        strMeasure9 = try values.decodeIfPresent(String.self, forKey: .strMeasure9)
        strMeasure10 = try values.decodeIfPresent(String.self, forKey: .strMeasure10)
        strMeasure11 = try values.decodeIfPresent(String.self, forKey: .strMeasure11)
        strMeasure12 = try values.decodeIfPresent(String.self, forKey: .strMeasure12)
        strMeasure13 = try values.decodeIfPresent(String.self, forKey: .strMeasure13)
        strMeasure14 = try values.decodeIfPresent(String.self, forKey: .strMeasure14)
        strMeasure15 = try values.decodeIfPresent(String.self, forKey: .strMeasure15)
        strImageSource = try values.decodeIfPresent(String.self, forKey: .strImageSource)
        strImageAttribution = try values.decodeIfPresent(String.self, forKey: .strImageAttribution)
        strCreativeCommonsConfirmed = try values.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed)
        dateModified = try values.decodeIfPresent(String.self, forKey: .dateModified)
    }

}
