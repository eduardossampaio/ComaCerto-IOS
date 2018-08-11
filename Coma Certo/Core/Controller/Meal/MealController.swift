//
//  MealController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 10/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
class MealController: NSObject {
    
    private static var cachedMeals = [Meal]()
    
    func onNewMeal(_ meal:Meal){
        MealController.cachedMeals.append(meal)
    }
    
    func listMeals(for date:Date) -> [Meal]{
        var result = [Meal]()
        for meal in MealController.cachedMeals{
            if meal.date?.toReadableDate() == date.toReadableDate(){
                result.append(meal)
            }
        }
        return result
    }
    
}
