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
    
    @IBOutlet weak var dateTextButton: UIButton!

    @IBOutlet weak var timeTextButton: UIButton!
    @IBOutlet weak var hungerBeforeSlider: UISlider!
    @IBOutlet weak var hungerAfterSlider: UISlider!
    
    var selectedDate = Date()
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func onSaveButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        dateTextButton.setTitle(selectedDate.toReadableDate(style: .short), for:.normal)
          timeTextButton.setTitle(selectedDate.toReadableTime(), for:.normal)
    }
    func openDatePicker(){
       
    }
    @IBAction func onSliderValueChanges(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
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
