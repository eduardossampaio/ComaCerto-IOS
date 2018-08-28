//
//  FoodIteractor.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 15/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
protocol FoodIteractor {
    func onScreenLoad()
    
    func onNewFoodEntered(food: Food)
    
}
