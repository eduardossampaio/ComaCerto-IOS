//
//  Food.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 11/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
struct Food : Codable{
    var primaryKey : String? = nil
    let name:String
    let category:String
    var portion : Int?

    
    init(primaryKey: String? = nil, name:String?,  category:String?, portion:Int? = 1) {
        self.primaryKey = primaryKey
        self.name = name ?? ""
        self.category = category ?? ""
        self.portion = portion
    }
}
