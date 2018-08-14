//
//  MealPersistence.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 14/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import RealmSwift
class MealPersistence {
    func saveMeal(_ meal: Meal){
        let mealRealmEntity = MealRealmEntity()
        mealRealmEntity.fromMeal(meal: meal)
        let realm = try! Realm()
        try! realm.write {
            realm.add(mealRealmEntity)
        }
    }
    
    func getMeals(forDate date: Date) -> [Meal] {
        let realm = try! Realm()
        let mealEntities = realm.objects(MealRealmEntity.self).filter("dateAndTime BETWEEN %@", [date.beginOfDay(), date.endOfDay()])
        var allMeals = [Meal]()
        for mealEntity in mealEntities{
            let meal = mealEntity.toMeal()
            allMeals.append(meal)
        }
        return allMeals
       
    }
}
