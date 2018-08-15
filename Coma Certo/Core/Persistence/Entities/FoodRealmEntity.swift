//
//  FoodRealmEntity.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 14/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import RealmSwift
class FoodRealmEntity : Object{
    @objc dynamic var primaryKey = UUID().uuidString
    @objc dynamic var name: String?
    @objc dynamic var category:String?
    
    override static func primaryKey() -> String? {
        return "primaryKey"
    }
}
