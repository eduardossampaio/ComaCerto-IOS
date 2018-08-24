//
//  AddFoodListCellView.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 23/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
class AddFoodListCellView : UITableViewCell{
    @IBOutlet weak var foodNameLabel:UILabel!
    @IBOutlet weak var portionQuantityLabel:UILabel!
    @IBOutlet weak var portionQuantityStepper:UIStepper!
    
    typealias OnPortionQuantityChange = ((Int) -> Void)
    var onPortionQuantityChange: OnPortionQuantityChange?
    
    @IBAction func onPortionValueChanged(_ sender: UIStepper) {
        let portion = Int(sender.value)
//        portionQuantityLabel.text = "\(portion)"
        onPortionQuantityChange?(portion)
    }
}
