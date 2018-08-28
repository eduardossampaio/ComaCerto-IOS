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
    var mealType: MealType!
    var whatDoing: String?
    var date = Date()
    var foods = [Food]()
    var hunger:Level = Level.hunger()
    var satiety:Level = Level.satiety()
    var feeling = Feeling.none
    
    init(){
        
    }
    
    init(mealType:MealType,whatDoing:String?, date:Date ,foods: [Food] ,hunger: Int ,satiety:Int ,feeling:Feeling) {
        self.mealType = mealType
        self.whatDoing = whatDoing
        self.date = date
        self.foods = foods
        self.hunger = Level.hunger(level: hunger)
        self.satiety = Level.satiety(level:satiety)
        self.feeling = feeling
    }
    
    enum CodingKeys: String, CodingKey{
        case mealType
        case date = "dateAndTime"
        case whatDoing = "whatWasDoing"
        case foods
        case hunger
        case satiety
        case feeling
    }
    
    func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(mealType.name, forKey: .mealType)
        try container.encode(whatDoing, forKey: .whatDoing)
        try container.encode(date.formatDate(format: "dd/MM/yyyy HH:mm"), forKey: .date)
        try container.encode(foods, forKey: .foods)
        try container.encode(hunger.selectedLevelName(), forKey: .hunger)
        try container.encode(satiety.selectedLevelName(), forKey: .satiety)
        try container.encode(feeling.name, forKey: .feeling)
    }
}
