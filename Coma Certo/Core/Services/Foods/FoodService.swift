//
//  FoodService.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 27/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
class FoodService : FoodIteractor {
    let foodPresenter : FoodPresenter
    let foodPersistence = FoodPersistence()
    init(presenter:FoodPresenter) {
        self.foodPresenter = presenter
    }
    
    func onScreenLoad() {
        let allFoods = foodPersistence.getFoodsList()
        if allFoods.isEmpty {
            fetchFoodsList()
        }else{
            foodPresenter.updateFoodList(foodsList: allFoods)
        }
    }
    
    func onNewFoodEntered(food: Food) {
        
    }
    
    private func fetchFoodsList(){
        let foodService = FoodHttpService()
        foodService.fetchFromWeb(){ foods, error in
            if error == nil{
                self.foodPersistence.saveFoodsList(foods!)
            }else{
                self.foodPresenter.updateFoodList(foodsList: [Food]())
            }
        }
    }
    
}
