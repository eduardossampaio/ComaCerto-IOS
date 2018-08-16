//
//  MealType.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 15/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit

enum  MealType : Displayable, Equatable{
    
    case breakfast
    case lunch
    case snack
    case dinner
    
    static var allCases = [MealType.breakfast,MealType.lunch,MealType.snack,MealType.dinner ]
    
    init?(rawValue: String) {
        switch rawValue {
        case "Café da Manhã": self = .breakfast
        case "Almoço": self = .lunch
        case "Lanche": self = .snack
        case "Janta": self = .dinner
        default: return nil
        }
    }
    
    var rawValue: String {
        switch self {
        case .breakfast: return "Café da Manhã"
        case .lunch: return "Almoço"
        case .snack: return "Lanche"
        case .dinner: return "Janta"
        }
    }

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
