//
//  Meal.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 10/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
class Meal : Codable  {
    var primaryKey : String?
    var mealType: MealType?
    var date = Date()
    var foods = [Food]()
    var hunger = 0
    var satiety = 0
    var feeling = Feeling.none
    
    init(){
        
    }
    init(mealType:MealType?, date:Date ,foods: [Food] ,hunger: Int ,satiety:Int ,feeling:Feeling) {
        self.mealType = mealType
        self.date = date
        self.foods = foods
        self.hunger = hunger
        self.satiety = satiety
        self.feeling = feeling
    }
    
}
