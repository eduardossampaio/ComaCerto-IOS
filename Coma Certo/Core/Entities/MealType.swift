//
//  MealType.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 15/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit

struct  MealType : Displayable , Codable {
    func displayName() -> String {
        return self.name
    }
    
    func displayImage() -> UIImage? {
        return UIImage(named: self.imageName)
    }
    
    
    var name:String
    var imageName:String
    var rawValue:Int
    
    static let breakfast = MealType(name: "Café da Manhã",imageName: "cafe",rawValue: 1)
    static let lunch = MealType(name: "Almoço",imageName: "almoco",rawValue: 2)
    static let snack = MealType(name: "Lanche",imageName: "lanche",rawValue: 3)
    static let dinner = MealType(name: "Janta",imageName: "janta",rawValue: 4)
    
    
    static var allCases = [breakfast,lunch,snack,dinner]
    
    private init(name: String,imageName:String,rawValue:Int) {
        self.name = name
        self.imageName = imageName
        self.rawValue = rawValue
    }

    func equals(other: Displayable) -> Bool {
        return self.displayName() == other.displayName()
    }
    
    static func get(rawValue value :Int) -> MealType{
        for mealType in allCases{
            if mealType.rawValue ==  value{
                return mealType
            }
        }
        return MealType.lunch
    }
}
