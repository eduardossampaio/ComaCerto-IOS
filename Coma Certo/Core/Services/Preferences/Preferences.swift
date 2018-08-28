//
//  Preferences.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 24/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
class Preferences {
    private let ENABLE_REMINDERS_KEY = "ENABLE_REMINDERS"
    private let BREAKFAST_HOUR_KEY = "BREAKFAST_HOUR"
    private let LUNCH_HOUR_KEY = "LUNCK_HOUR"
    private let SNACK_HOUR_KEY = "SNACK_HOUR"
    private let DINNER_HOUR_KEY = "DINNER_HOUR"
    
    static let instance = Preferences()
    let userPreferences = UserDefaults.standard
    private init() {}
    
    func preload(){
        let defaults = [
            ENABLE_REMINDERS_KEY: false,
            BREAKFAST_HOUR_KEY:"08:00",
            LUNCH_HOUR_KEY:"12:00",
            SNACK_HOUR_KEY:"16:00",
            DINNER_HOUR_KEY:"20:00"
        ] as [String : Any]
        userPreferences.register(defaults: defaults)
    }
    var remindersEnabled: Bool{
        get { return userPreferences.bool(forKey: ENABLE_REMINDERS_KEY) }
        set { userPreferences.set(newValue, forKey: ENABLE_REMINDERS_KEY)}
    }
    var breakfastHour: String? {
        get { return userPreferences.string(forKey: BREAKFAST_HOUR_KEY) }
        set{ userPreferences.set(newValue, forKey: BREAKFAST_HOUR_KEY) }
    }
    
    var lunchHour: String? {
        get { return userPreferences.string(forKey: LUNCH_HOUR_KEY) }
        set{ userPreferences.set(newValue, forKey: LUNCH_HOUR_KEY) }
    }
    
    var snackHour: String? {
        get { return userPreferences.string(forKey: SNACK_HOUR_KEY)}
        set{ userPreferences.set(newValue, forKey: SNACK_HOUR_KEY)}
    }
    
    var dinnerHour: String? {
        get { return userPreferences.string(forKey: DINNER_HOUR_KEY)}
        set{ userPreferences.set(newValue, forKey: DINNER_HOUR_KEY)}
    }
   

}
