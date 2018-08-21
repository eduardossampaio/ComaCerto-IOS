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
    
    enum CodingKeys: String, CodingKey{
        case mealType
        case date = "dateAndTime"
        case foods
        case hunger
        case satiety
        case feeling
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(mealType?.name, forKey: .mealType)
        try container.encode(date.formatDate(format: "dd/MM/yyyy HH:mm"), forKey: .date)
        try container.encode(foods, forKey: .foods)
        try container.encode(hunger, forKey: .hunger)
        try container.encode(satiety, forKey: .satiety)
        try container.encode(feeling.name, forKey: .feeling)
    }
    
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
