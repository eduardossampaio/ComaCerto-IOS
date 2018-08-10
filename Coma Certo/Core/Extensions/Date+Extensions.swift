//
//  Date+Extensions.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 10/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
extension Date{
  
    func toReadableDate(style: DateFormatter.Style = .medium) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
    
    func toReadableWeekDay() -> String{
        let dateFormatter = DateFormatter()
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        dateFormatter.dateStyle = .medium
        return dateFormatter.weekdaySymbols[ calendar.component(.weekday, from: self) - 1]
    }
    
    func toReadableTime() -> String{
         let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
}
