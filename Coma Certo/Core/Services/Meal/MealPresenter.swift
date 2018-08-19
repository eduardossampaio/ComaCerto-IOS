//
//  MealPresenter.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 13/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
protocol MealPresenter : ViewPresenter{
    func updateMealList(meals: [Meal])
    
}
