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
    let portion = 1

    init( name:String?, category:String?) {
        self.name = name ?? ""
        self.category = category ?? ""
    }
    
    init(primaryKey: String?, name:String?,  category:String?) {
        self.primaryKey = primaryKey
        self.name = name ?? ""
        self.category = category ?? ""
        
    }
}
