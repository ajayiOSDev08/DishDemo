//
//  DishViewModel.swift
//  DishDemo
//
//  Created by CEL-MGMT-IT on 11/06/24.
//

import Foundation

class DishViewModel {
    
    var meals: [Dish] = []
    
    var numberOfDishes: Int {
        return meals.count
    }
    
    // Closure to reload table view
    var reloadTableViewClosure: (() -> Void)?
    
    func setReloadTableViewClosure(_ closure: @escaping () -> Void) {
        self.reloadTableViewClosure = closure
    }
    
    func fetchDishes() {
        APIService.fetchDishes { result in
            switch result {
            case .success(let model):                
                if let meals = model.meals {
                    self.meals.append(contentsOf: meals)
                }
                
                // Trigger table view reload closure
                self.reloadTableViewClosure?()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getDishes(at index: Int) -> Dish? {
        guard index < meals.count else { return nil }
        return meals[index]
    }
}
