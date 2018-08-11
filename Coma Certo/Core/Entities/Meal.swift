//
//  Meal.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 10/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
struct Meal {
    var date:Date?
    var time:Date?
    var foods: [String]?
    var hungryBefore: Int?
    var hungryAfter:Int?
    var feeling:Feeling?
    
    init( date:Date? ,time:Date? ,foods: [String]? ,hungryBefore: Int? ,hungryAfter:Int? ,feeling:Feeling?) {
        self.date = date
        self.time = time
        self.foods = foods
        self.hungryBefore = hungryBefore
        self.hungryAfter = hungryAfter
        self.feeling = feeling
    }
    
}