//
//  Feeling.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 10/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
struct Feeling : Equatable,Displayable,Codable {
   
    func displayName() -> String {
        return name
    }
    
    func displayImage() -> UIImage? {
        return UIImage(named: imageName)
    }
    
    func equals(other: Displayable) -> Bool {
        return self.displayName() == other.displayName()
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
//        Feeling(id: 1,"Alegria", "emoji-happy"),
        Feeling(id: 1,"Tranquilo", "emoji-natural"),
        Feeling(id: 2,"Ansioso", "emoji-anxiety"),
        Feeling(id: 3,"Frustado", "emoji-frustration"),
        Feeling(id: 4,"Irritado", "emoji-irritation"),
        Feeling(id: 5,"Com pressa", "emoji-hurry"),
        Feeling(id: 6,"Com raiva", "emoji-rage"),
        Feeling(id: 7,"Entediado", "emoji-boredom"),
        Feeling(id: 8,"Triste", "emoji-sad")
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
