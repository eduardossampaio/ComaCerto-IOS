//
//  Slider+Extensions.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 15/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
extension UISlider {
    func doStep(step: Float) {
        let roundedValue = round(self.value / step) * step
        self.value = roundedValue
    }
}
