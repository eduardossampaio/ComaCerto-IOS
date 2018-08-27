//
//  Status.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 27/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
class Level : Codable{
    var level: Int = 1
    var levelNames : [String]
    
    private static let hungerStatusNames = ["Nada de fome","Pouca fome","Com Fome","Muita Fome","Morrendo de fome"]
    private static let satietyStatusNames = ["Continuo com fome","Poderia comer mais","Estou satisfeito","Comi demais","Vou explodir"]
    
    static func hunger(level:Int = 1) -> Level{
        return Level(level: level,levelNames: hungerStatusNames)
    }
    static func satiety(level:Int = 1) -> Level{
        return Level(level: level,levelNames: satietyStatusNames)
    }
    init(levelNames: [String]) {
        self.levelNames = levelNames
    }
    init(level:Int,levelNames: [String]) {
        self.levelNames = levelNames
        self.level = level
    }
    
    func selectedLevelName() -> String{
        return levelNames[level - 1]
    }
}
