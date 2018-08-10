//
//  RegisterMealViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 09/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
class RegisterMealViewController: UITableViewController {
    @IBOutlet weak var dateTextView: UILabel!
    @IBOutlet weak var timeTextView: UILabel!
    @IBOutlet weak var hungerBeforeSlider: UISlider!
    @IBOutlet weak var hungerAfterSlider: UISlider!
    
    var selectedDate: Date!
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dateTextView.text = selectedDate.toReadableDate(style: .short)
        timeTextView.text = selectedDate.toReadableTime()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "listFoodSegue"){
            let foods  = ["Arroz","Feijão","Carne","Ovo","Frango","Salada"]
            let controller = segue.destination as! ListFoodTableViewController
            controller.foodList = foods
        }else if(segue.identifier == "listReactionsSegue"){
            
        }
    }
}
