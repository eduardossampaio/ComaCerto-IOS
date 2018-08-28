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
    let notificationService = NotificationService()
    
    init(presenter: SettingsPresenter) {
        self.presenter = presenter
    }
    
    func onScreenLoaded() {
        presenter.setNotificationsEnabled(Preferences.instance.remindersEnabled)
        presenter.updateNotificationHour(hour: toDate(hour: Preferences.instance.breakfastHour!), for: MealType.breakfast)
        presenter.updateNotificationHour(hour: toDate(hour: Preferences.instance.lunchHour!), for: MealType.lunch)
        presenter.updateNotificationHour(hour: toDate(hour: Preferences.instance.snackHour!), for: MealType.snack)
        presenter.updateNotificationHour(hour: toDate(hour: Preferences.instance.dinnerHour!), for: MealType.dinner)
    }
    func onScreenClose() {
        scheduleNotifications()
    }
    func onScheduleNotificationsChange(_ notificationsEnabled: Bool) {
       Preferences.instance.remindersEnabled = notificationsEnabled
        if notificationsEnabled {
            scheduleNotifications()
        }else{
            cancelScheduleNotifications()
        }
    }
    
    func onNotificationAlarmChanged(mealType: MealType, hour: Date) {
        if mealType.equals(other: MealType.breakfast){
            Preferences.instance.breakfastHour = hour.toReadableTime()
            notificationService.scheduleNotification(for: MealType.breakfast, at: toDate(hour: Preferences.instance.breakfastHour!))
        }else if mealType.equals( other: MealType.lunch){
            Preferences.instance.lunchHour = hour.toReadableTime()
            notificationService.scheduleNotification(for: MealType.lunch, at: toDate(hour: Preferences.instance.lunchHour!))
        }else if mealType.equals( other: MealType.snack){
            Preferences.instance.snackHour = hour.toReadableTime()
            notificationService.scheduleNotification(for: MealType.snack, at: toDate(hour: Preferences.instance.snackHour!))
        }else if mealType.equals( other: MealType.dinner){
            Preferences.instance.dinnerHour = hour.toReadableTime()
            notificationService.scheduleNotification(for: MealType.dinner, at: toDate(hour: Preferences.instance.dinnerHour!))
        }
    }
    
    func scheduleNotifications(){
        notificationService.scheduleNotification(for: MealType.breakfast, at: toDate(hour: Preferences.instance.breakfastHour!))
        notificationService.scheduleNotification(for: MealType.lunch, at: toDate(hour: Preferences.instance.lunchHour!))
        notificationService.scheduleNotification(for: MealType.snack, at: toDate(hour: Preferences.instance.snackHour!))
        notificationService.scheduleNotification(for: MealType.dinner, at: toDate(hour: Preferences.instance.dinnerHour!))
    }
    
    func cancelScheduleNotifications(){
        notificationService.cancelAllScheduleNotifications()
    }
    
    private func toDate(hour:String) -> Date{
        return Date.fromFormat(format: "HH:mm", formattedDate: hour)!
    }
    
}
