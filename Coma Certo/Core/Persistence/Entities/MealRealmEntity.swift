//
//  Meal.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 14/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import RealmSwift
class MealRealmEntity : Object {
    @objc dynamic var primaryKey = UUID().uuidString
    @objc dynamic var dateAndTime = NSDate()
    var foods = List<FoodRealmEntity>()
    @objc dynamic var hungryBefore = 0
    @objc dynamic var hungryAfter = 0
    @objc dynamic var feeling = 0
    
    override static func primaryKey() -> String? {
        return "primaryKey"
    }
    
}
