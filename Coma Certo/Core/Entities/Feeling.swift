//
//  Feeling.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 10/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
struct Feeling : Equatable , Displayable{
    func displayName() -> String {
        return name
    }
    
    func displayImage() -> UIImage? {
        return UIImage(named: imageName)
    }
    
    var id:Int
    var name:String
    var imageName:String
    init(id:Int, _ name:String, _ imageName:String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
    
    static func ==(lhs: Feeling, rhs: Feeling) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let allFeelings = [
        Feeling(id: 1,"Alegria", "emoji-happy"),
        Feeling(id: 2,"Ansiedade ", "emoji-anxiety"),
        Feeling(id: 3,"Frustração ", "emoji-frustration"),
        Feeling(id: 4,"Irritação ", "emoji-irritation"),
        Feeling(id: 5,"Pressa ", "emoji-hurry"),
        Feeling(id: 6,"Raiva ", "emoji-rage"),
        Feeling(id: 7,"Tédio ", "emoji-boredom"),
        Feeling(id: 8,"Tristeza ", "emoji-sad")
    ]
    
    static let none = Feeling(id: -1, "", "")
    
    static func getFeeling(byId id: Int) -> Feeling{
        for felling in allFeelings{
            if felling.id == id {
                return felling
            }
        }
        return allFeelings[0]
    }
}
