//
//  RegisterMealViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 09/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
import CustomizableActionSheet
class RegisterMealViewController: UITableViewController {
    
    typealias OnNewMealSaved = ((Meal) -> Void)
    
    @IBOutlet weak var dateTextButton: UIButton!
    @IBOutlet weak var timeTextButton: UIButton!
    @IBOutlet weak var hungerSlider: UISlider!
    @IBOutlet weak var satietySlider: UISlider!
    @IBOutlet weak var whatIAteCell: UITableViewCell!
    @IBOutlet weak var hungerStatusLabel: UILabel!
    @IBOutlet weak var satietyStatusLabel: UILabel!
    
    private let hungerStatus = ["Nenhuma Fome","Um pouco de fome","Com Fome","Muita Fome","Bastante Fome"]
    private let satietyStatus = ["Nem um pouco saciado","Um pouco saciado","Saciado","Muito Saciado","Bastante Saciado"]
    //embeededViewControllers
    private var listFoodTableViewController: ListFoodTableViewController!
    private var feelingsCollectionViewController: ImageCollectionViewController!
    private var mealTypesCollectionViewController: ImageCollectionViewController!
    
    var meal = Meal()
    
    var onNewMealSaved: OnNewMealSaved?
    
    @IBAction func onSaveButtonClicked(_ sender: Any) {
        let hunger = Int(hungerSlider.value)
        let satiety = Int(satietySlider.value)

        meal.hunger = hunger
        meal.satiety = satiety
        onNewMealSaved?(meal)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onDateButtonClicked(_ sender: Any) {
        openDatePickerActionSheet()
    }
    
    @IBAction func onTimeButtonClicked(_ sender: Any) {
        openTimePickerActionSheet()
    }
    
    @IBAction func onCancelButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onHungerSliderChanges(_ sender: UISlider) {
        sender.doStep(step: 1)
        updateHungerStatusLabel()
    }
    @IBAction func onSatietySliderChanges(_ sender: UISlider) {
        sender.doStep(step: 1)
        updateSatietyStatusLabel()
    }
    override func viewWillAppear(_ animated: Bool) {
        updateDateTimeLabels()
        updateSliders()
    }
    func updateDateTimeLabels(){
        dateTextButton.setTitle(meal.date.toReadableDate(style: .short), for:.normal)
        timeTextButton.setTitle(meal.date.toReadableTime(), for:.normal)
    }
    func updateSliders(){
        hungerSlider.value = Float(meal.hunger)
        satietySlider.value = Float(meal.satiety)
        updateHungerStatusLabel()
        updateSatietyStatusLabel()
    }
    func updateHungerStatusLabel(){
        let index = Int(hungerSlider.value)
        let status = hungerStatus[index - 1]
        hungerStatusLabel.text = status
        meal.hunger = index
    }
    func updateSatietyStatusLabel(){
        let index = Int(satietySlider.value)
        let status = satietyStatus[index - 1]
        satietyStatusLabel.text = status
        meal.satiety = index
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "listFoodSegue"){
            let controller = segue.destination as! ListFoodTableViewController
            self.listFoodTableViewController = controller
            controller.foodList = meal.foods
            controller.onFoodListUpdate = { (foodList) in
                self.meal.foods = foodList;
                self.tableView.reloadData()
            }
            controller.onAddNewFoodClicked = {
                self.performSegue(withIdentifier: "selectFoodsSegue", sender: nil)
            }
        }else if(segue.identifier == "listFeelingsSegue"){
            let controller = segue.destination as! ImageCollectionViewController
            self.feelingsCollectionViewController = controller
            controller.items = Feeling.allFeelings
            controller.onItemSelected = {(feeling) in
                self.meal.feeling = feeling as! Feeling
            }
            if meal.feeling == Feeling.none{
                controller.preselectedItem = Feeling.getFeeling(byId: 0)
            }else{
                controller.preselectedItem = meal.feeling
            }
        }else if (segue.identifier == "listMealTypesSegue"){
            let controller = segue.destination as! ImageCollectionViewController
            self.mealTypesCollectionViewController = controller
            controller.items = MealType.allCases
            controller.onItemSelected = {(mealType) in
                self.meal.mealType = mealType as! MealType
            }
        }else if(segue.identifier == "selectFoodsSegue"){
            let controller = segue.destination as! AddFoodsToMealViewController
            controller.selectedFoods = self.meal.foods
            controller.onFoodListUpdate = { (foodList) in
                self.meal.foods = foodList;
                self.listFoodTableViewController.foodList = foodList
                self.listFoodTableViewController.tableView.reloadData()
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 && meal.foods.count > 0{
            return CGFloat(44 * (meal.foods.count + 1) )
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    private func openDatePickerActionSheet(){
       openDateActionSheet(date: meal.date, mode: .date)
    }
    
    private func openTimePickerActionSheet(){
       openDateActionSheet(date: meal.date, mode:.time)
    }
    
    @objc override func datePickerValueChanged(_ sender: UIDatePicker){
        self.meal.date =  sender.date
        updateDateTimeLabels()
    }
}
