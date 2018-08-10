//
//  Feeling.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 10/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
struct Feeling{
    
    var displayName:String
    var imageName:String
    init(_ displayName:String, _ imageName:String) {
        self.displayName = displayName
        self.imageName = imageName
    }
    static let allFeelings = [
        Feeling("Alegria", "emoji-happy"),
        Feeling("Ansiedade ", "emoji-anxiety"),
        Feeling("Frustração ", "emoji-frustration"),
        Feeling("Irritação ", "emoji-irritation"),
        Feeling("Pressa ", "emoji-hurry"),
        Feeling("Raiva ", "emoji-rage"),
        Feeling("Tédio ", "emoji-boredom"),
        Feeling("Tristeza ", "emoji-sad")
    ]
}
