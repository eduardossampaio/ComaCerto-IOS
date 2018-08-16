//
//  Meal.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 10/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
struct Meal {
    var primaryKey : String?
    
    var date = Date()
    var foods = [Food]()
    var hunger = 0
    var satiety = 0
    var feeling = Feeling.none
    
    init(){
        
    }
    init( date:Date ,foods: [Food] ,hunger: Int ,satiety:Int ,feeling:Feeling) {
        self.date = date
        self.foods = foods
        self.hunger = hunger
        self.satiety = satiety
        self.feeling = feeling
    }
    
}
