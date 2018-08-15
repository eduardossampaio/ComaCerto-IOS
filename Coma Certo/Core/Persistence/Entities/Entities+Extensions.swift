//
//  Entities+Extensions.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 14/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import RealmSwift
extension MealRealmEntity{
    
    func toMeal() -> Meal{
        let date = Date(timeIntervalSince1970: self.dateAndTime.timeIntervalSince1970)
        let feeling = self.feeling
        let hungryBefore = self.hungryBefore
        let hungryAfter = self.hungryAfter
        var allFoods = [Food]()
        for foodRealmEntity in foods{
            allFoods.append(foodRealmEntity.toFood())
        }
        let meal = Meal(date: date, foods: allFoods, hungryBefore: hungryBefore, hungryAfter: hungryAfter, feeling: Feeling.getFeeling(byId:feeling))
        return meal
    }
    
    func fromMeal(meal:Meal){
        self.dateAndTime = NSDate(timeIntervalSince1970: (meal.date.timeIntervalSince1970))
        self.feeling = meal.feeling.id
        self.hungryBefore = meal.hungryBefore
        self.hungryAfter = meal.hungryAfter
        let allFoods = List<FoodRealmEntity>()
        for food in meal.foods{
            let foodRealmEntity = FoodRealmEntity()
            foodRealmEntity.fromFood(food: food)
            allFoods.append(foodRealmEntity)
        }
        self.foods = allFoods
    }
}

extension FoodRealmEntity{
    
    func toFood() -> Food{
       return Food(name: self.name ?? "", category: self.category ?? "")
    }
    
    func fromFood(food:Food){
        self.name = food.name
        self.category = food.category
    }
}
