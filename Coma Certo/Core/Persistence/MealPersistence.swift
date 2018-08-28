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
        return realm.object(ofType: MealRealmEntity.self, forPrimaryKey: meal.primaryKey)
    }
    func saveOrUpdateMeal(_ meal: Meal){
        if(meal.primaryKey == nil || (meal.primaryKey?.isEmpty)!){
            saveMeal(meal)
        }else{
            updateMeal(meal)
        }
    }
    func saveMeal(_ meal: Meal){
        let realm = try! Realm()
        let mealRealmEntity = MealRealmEntity()
        mealRealmEntity.fromMeal(meal: meal)
        
        try! realm.write {
            realm.add(mealRealmEntity)
        }
    }
    func updateMeal(_ meal : Meal){
        if let mealRealmEntity = getRealmObject(meal){
        let realm = try! Realm()
            try! realm.write {
                mealRealmEntity.fromMeal(meal: meal)
                realm.add(mealRealmEntity, update: true)
            }
        }
    }
    
    func getMeals(forDate date: Date) -> [Meal] {
       return getMeals(initialDate: date, finalDate: date)
    }
    
    
    func getMeals(initialDate: Date,finalDate:Date) -> [Meal] {
        let realm = try! Realm()
        let mealEntities = realm.objects(MealRealmEntity.self).filter("dateAndTime BETWEEN %@", [initialDate.beginOfDay(), finalDate.endOfDay()]).sorted(byKeyPath: "dateAndTime", ascending: true)
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
