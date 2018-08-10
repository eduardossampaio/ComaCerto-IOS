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
    
    let foods  = ["Arroz","Feijão","Carne","Ovo","Frango","Salada"]
    
    var selectedDate = Date()
    let mealController = MealController()
    var selectedFeeling: Feeling?
    override func viewDidLoad() {
        
    }
    
    @IBAction func onSaveButtonClicked(_ sender: Any) {
        let hungerBefore = Int(hungerBeforeSlider.value)
        let hungerAfter = Int(hungerAfterSlider.value)
        let foods = self.foods
        let meal = Meal(date: selectedDate, time: selectedDate, foods: foods, hungryBefore: hungerBefore, hungryAfter: hungerAfter, feeling: selectedFeeling)
        mealController.onNewMeal(meal)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onCancelButtonClicked(_ sender: Any) {
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
            let controller = segue.destination as! ListFoodTableViewController
            controller.foodList = foods
        }else if(segue.identifier == "listReactionsSegue"){
            let controller = segue.destination as! ReactionsCollectionViewController
            controller.onFeelingSelected = {(feeling) in
                self.selectedFeeling = feeling
            }
        }
    }
}
