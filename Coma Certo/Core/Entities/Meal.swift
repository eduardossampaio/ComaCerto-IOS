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
    var hungryBefore = 0
    var hungryAfter = 0
    var feeling = Feeling.none
    
    init(){
        
    }
    init( date:Date ,foods: [Food] ,hungryBefore: Int ,hungryAfter:Int ,feeling:Feeling) {
        self.date = date
        self.foods = foods
        self.hungryBefore = hungryBefore
        self.hungryAfter = hungryAfter
        self.feeling = feeling
    }
    
}
