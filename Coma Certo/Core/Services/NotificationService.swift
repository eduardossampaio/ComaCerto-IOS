//
//  NotificationService.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 27/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UserNotifications
class NotificationService {
    let BREAKFAST_NOTIFICATION_NAME   = "BREAKFAST_NOTIFICATION"
    let LUNCH_NOTIFICATION_NAME       = "LUNCH_NOTIFICATION"
    let SNACK_NOTIFICATION_NAME       = "SNACK_NOTIFICATION"
    let DINNER_NOTIFICATION_NAME      = "DINNER_NOTIFICATION"
    
    func cancelAllScheduleNotifications(){
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
    }
    
    func scheduleNotification(for mealType:MealType,at hour: Date){
        var notificationName = ""
        var notificationBody = ""
        var notificationTitle = "Não se esqueça"
        if mealType.equals(other: MealType.breakfast){
            notificationName = BREAKFAST_NOTIFICATION_NAME
            notificationBody = "Está quase na hora do seu Café da Manhã"
        }else if(mealType.equals(other: MealType.lunch)){
            notificationName = LUNCH_NOTIFICATION_NAME
            notificationBody = "Está quase na hora do seu Almoço"
        }else if(mealType.equals(other: MealType.snack)){
            notificationName = SNACK_NOTIFICATION_NAME
            notificationBody = "Está quase na hora do seu Lanche"
        }else if(mealType.equals(other: MealType.dinner)){
            notificationName = DINNER_NOTIFICATION_NAME
            notificationBody = "Está quase na hora do seu Jantar"
        }
        scheduleNotification(notificationName: notificationName, title: notificationTitle, body: notificationBody, when: hour)
    }
    
    func scheduleNotification(notificationName:String,title:String,body:String,when:Date){
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        var date = DateComponents()
        date.hour = when.getHour()
        date.minute = when.getMinute()
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)

        let identifier = notificationName
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content, trigger: trigger)
        center.add(request, withCompletionHandler: { (error) in
            if let error = error {
                print(error)
            }
        })
    }
    
}
