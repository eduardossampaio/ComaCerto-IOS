//
//  FoodPersistence.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 27/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import RealmSwift
class FoodPersistence {
    
    func getFoodsList() -> [Food] {
        let realm = try! Realm()
        let foodsEntityList =  realm.objects(FoodRealmEntity.self)
        var foodsList = [Food]()
        for entity in foodsEntityList{
            foodsList.append(entity.toFood())
        }
        return foodsList
    }
    
    func saveFoodsList(_ foodList:[Food]){
        let realm = try! Realm()
        for food in foodList{
            let foodEntity = FoodRealmEntity()
            foodEntity.fromFood(food: food)
            try! realm.write {
                realm.add(foodEntity)
            }
        }

    }
}
