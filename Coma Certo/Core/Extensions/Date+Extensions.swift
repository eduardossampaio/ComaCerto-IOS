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
    
    func beginOfDay() ->Date{
        return setTime(hour:0,minute: 0,second: 0)
    }
    func endOfDay() ->Date{
        return setTime(hour:23,minute: 59,second: 59)
    }
    
    func setTime(hour:Int, minute:Int,second:Int = 0) -> Date {
        let date = Calendar.current.date(bySettingHour: hour, minute: minute, second: second, of: self)!
        return date
    }
}
