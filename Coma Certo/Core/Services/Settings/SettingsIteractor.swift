//
//  SettingsIteractor.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 27/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
protocol SettingsIteractor  {
    func onScreenLoaded()
    
    func onScreenClose()
    
    func onScheduleNotificationsChange(_ notificationsEnabled: Bool)
    
    func onNotificationAlarmChanged(mealType: MealType, hour:Date)
}
