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
    
    private func getRealmObject(_ meal:Meal) -> MealRealmEntity?{
        let realm = try! Realm()

        let mealEntities = realm.objects(MealRealmEntity.self).filter("dateAndTime =%@",meal.date );
        if mealEntities.count > 0{
            return mealEntities.first
        }
        return nil
    }
    
    func saveMeal(_ meal: Meal){
        let realm = try! Realm()
        let mealRealmEntity = MealRealmEntity()
        mealRealmEntity.fromMeal(meal: meal)
        
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
    
    func deleteMeal(meal: Meal){
        let realm = try! Realm()
        if let mealRealmEntity = getRealmObject(meal){
            try! realm.write {
                realm.delete(mealRealmEntity)
            }
        }
    }
}
