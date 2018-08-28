//
//  SettingsService.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 27/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
class SettingsService : SettingsIteractor{
    let presenter: SettingsPresenter!
    
    init(presenter: SettingsPresenter) {
        self.presenter = presenter
    }
    
    func onScreenLoaded() {
        presenter.setNotificationsEnabled(Preferences.instance.remindersEnabled)
        presenter.updateNotificationHour(hour: Date.fromFormat(format: "HH:mm", formattedDate: Preferences.instance.breakfastHour!)!, for: MealType.breakfast)
        presenter.updateNotificationHour(hour: Date.fromFormat(format: "HH:mm", formattedDate: Preferences.instance.lunchHour!)!, for: MealType.lunch)
        presenter.updateNotificationHour(hour: Date.fromFormat(format: "HH:mm", formattedDate: Preferences.instance.snackHour!)!, for: MealType.snack)
        presenter.updateNotificationHour(hour: Date.fromFormat(format: "HH:mm", formattedDate: Preferences.instance.dinnerHour!)!, for: MealType.dinner)
    }
    
    func onScheduleNotificationsChange(_ notificationsEnabled: Bool) {
       Preferences.instance.remindersEnabled = notificationsEnabled
        if notificationsEnabled {
            
        }else{
            cancelScheduleNotifications()
        }
    }
    
    func onNotificationAlarmChanged(mealType: MealType, hour: Date) {
        if mealType.equals(other: MealType.breakfast){
            Preferences.instance.breakfastHour = hour.toReadableTime()
        }else if mealType.equals( other: MealType.lunch){
            Preferences.instance.lunchHour = hour.toReadableTime()
        }else if mealType.equals( other: MealType.snack){
            Preferences.instance.snackHour = hour.toReadableTime()
        }else if mealType.equals( other: MealType.dinner){
            Preferences.instance.dinnerHour = hour.toReadableTime()
        }
    }
    
    
    func scheduleNotifications(){
        
    }
    
    func cancelScheduleNotifications(){
        
    }
    
}
