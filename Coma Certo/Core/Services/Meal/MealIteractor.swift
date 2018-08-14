//
//  MealIteractor.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 13/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
protocol MealIteractor {
    func dateSelected(date:Date)
    
    func onSavePressed(meal:Meal)
    
    func onDeletePressed(meal: Meal)
    
    func onCancelPressed()
}
