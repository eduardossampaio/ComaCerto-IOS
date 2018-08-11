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
    @IBOutlet weak var whatIAteCell: UITableViewCell!
    
    //embeededViewControllers
    private var listFoodTableViewController: ListFoodTableViewController!
    private var reactionsCollectionViewController: ReactionsCollectionViewController!
    var foods = [String]()
    var selectedDate = Date()
    let mealController = MealController()
    var selectedFeeling: Feeling?
  
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
    
    @IBAction func onSliderValueChanges(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
    }
    override func viewWillAppear(_ animated: Bool) {
        dateTextButton.setTitle(selectedDate.toReadableDate(style: .short), for:.normal)
        timeTextButton.setTitle(selectedDate.toReadableTime(), for:.normal)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "listFoodSegue"){
            let controller = segue.destination as! ListFoodTableViewController
            self.listFoodTableViewController = controller
            controller.foodList = foods
            controller.onFoodListUpdate = { (foodList) in
                self.foods = foodList;
                self.tableView.reloadData()
            }
            controller.onAddNewFoodClicked = {
                self.performSegue(withIdentifier: "selectFoodsSegue", sender: nil)
            }
        }else if(segue.identifier == "listReactionsSegue"){
            let controller = segue.destination as! ReactionsCollectionViewController
            self.reactionsCollectionViewController = controller
            controller.onFeelingSelected = {(feeling) in
                self.selectedFeeling = feeling
            }
        }else if(segue.identifier == "selectFoodsSegue"){
            let controller = segue.destination as! AddFoodsToMealViewController
            controller.selectedFoods = self.foods
            controller.onFoodListUpdate = { (foodList) in
                self.foods = foodList;
                self.listFoodTableViewController.foodList = foodList
                self.listFoodTableViewController.tableView.reloadData()
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && foods.count > 0{
            return CGFloat(44 * (foods.count + 1) )
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}
