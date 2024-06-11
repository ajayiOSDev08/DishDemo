//
//  DishModel.swift
//  DishDemo
//
//  Created by CEL-MGMT-IT on 11/06/24.
//

import Foundation

struct DishModel: Codable {
    let meals: [Dish]?
}

struct Dish: Codable {
    let strMeal: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
}

extension Dish {
    func nonEmptyIngredients() -> [String] {
        var ingredients = [String]()
        
        let mirror = Mirror(reflecting: self)
        
        for child in mirror.children {
            if let label = child.label, label.starts(with: "strIngredient") {
                if let ingredient = child.value as? String, !ingredient.isEmpty {
                    ingredients.append(ingredient)
                }
            }
        }
        
        return ingredients
    }
}
