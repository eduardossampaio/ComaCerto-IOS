//
//  MealReportRequest.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 20/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
class MealReportRequest : Codable{
    var initialDate : String
    var finalDate : String
    var meals : [Meal]
    
    init(_ initialDate:Date,_ finalDate:Date,_ meals:[Meal]) {
        self.initialDate = initialDate.formatDate(format: "dd/MM/yyyy")
        self.finalDate = finalDate.formatDate(format: "dd/MM/yyyy")
        self.meals = meals
    }
}
