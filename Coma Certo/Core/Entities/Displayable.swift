//
//  Displayable.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 15/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
protocol Displayable {
    func displayName() -> String
    
    func displayImage() -> UIImage?
    
    func equals(other:Displayable) -> Bool 
}
