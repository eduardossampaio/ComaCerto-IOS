//
//  SettingsPresenter.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 27/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
protocol SettingsPresenter : ViewPresenter {
    func setNotificationsEnabled(_ enabled: Bool)
    
    func updateNotificationHour(hour: Date, for mealType:MealType)
}
