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
        dateFormatter.dateStyle = .medium
        return dateFormatter.weekdaySymbols[ Calendar.current.component(.weekday, from: self) - 1]
    }
    
    func formatDate(format:String) -> String{
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = format
        return dateFormatterPrint.string(from: self);
    }
    static func fromFormat(format:String,formattedDate:String) -> Date?{
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = format
        return dateFormatterPrint.date(from: formattedDate)
    }
    func toReadableTime() -> String{
        return formatDate(format: "HH:mm")
    }
    
    func beginOfDay() ->Date{
        return setTime(hour:0,minute: 0,second: 0)
    }
    func endOfDay() ->Date{
        return setTime(hour:23,minute: 59,second: 59)
    }
    
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
    func setTime(hour:Int, minute:Int,second:Int = 0) -> Date {
        let date = Calendar.current.date(bySettingHour: hour, minute: minute, second: second, of: self)!
        return date
    }
    func getHour() -> Int {
        let units: Set<Calendar.Component> = [.hour]
        let comp = Calendar.current.dateComponents(units, from: self)
        return comp.hour ?? 0
    }
    func getMinute() -> Int {
        let units: Set<Calendar.Component> = [.minute]
        let comp = Calendar.current.dateComponents(units, from: self)
        return comp.minute ?? 0
    }

}
