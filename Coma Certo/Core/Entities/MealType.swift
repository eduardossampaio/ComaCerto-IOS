//
//  MealType.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 15/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit

enum  MealType : Displayable, Equatable {
    
    case breakfast
    case lunch
    case snack
    case dinner
    
    static var allCases = [MealType.breakfast,MealType.lunch,MealType.snack,MealType.dinner ]
    
    static func ==(lhs: MealType, rhs: MealType) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    static func get(rawValue value :Int) -> MealType{
        for mealType in allCases{
            if mealType.rawValue ==  value{
                return mealType
            }
        }
        return MealType.lunch
    }
        init?(rawValue: Int) {
            switch rawValue {
            case 1 : self = .breakfast
            case 2 : self = .lunch
            case 3 : self = .snack
            case 4 : self = .dinner
            default: return nil
            }
        }

        var rawValue: Int {
            switch self {
            case .breakfast: return 1
            case .lunch: return 2
            case .snack: return 3
            case .dinner: return 4
            }
        }

//    init?(rawValue: Int) {
//        switch rawValue {
//        case "Café da Manhã": self = .breakfast
//        case "Almoço": self = .lunch
//        case "Lanche": self = .snack
//        case "Janta": self = .dinner
//        default: return nil
//        }
//    }
//
//    var rawValue: String {
//        switch self {
//        case .breakfast: return "Café da Manhã"
//        case .lunch: return "Almoço"
//        case .snack: return "Lanche"
//        case .dinner: return "Janta"
//        }
//    }

    func displayName() -> String {
        switch self{
        case .breakfast:
            return "Café da Manhã"
        case .lunch:
            return "Almoço"
        case .snack:
            return "Lanche"
        case .dinner:
            return "Janta"
        }
    }
    
    func displayImage() -> UIImage? {
        switch self{
        case .breakfast:
            return UIImage(named: "cafe")
        case .lunch:
            return UIImage(named: "almoco")
        case .snack:
            return UIImage(named: "lanche")
        case .dinner:
            return UIImage(named: "janta")
        }
    }
    
}
