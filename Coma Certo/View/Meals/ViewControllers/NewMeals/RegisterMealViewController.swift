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
//https://github.com/beryu/CustomizableActionSheet
class RegisterMealViewController: UITableViewController {
    
    typealias OnNewMealSaved = ((Meal) -> Void)
    
    @IBOutlet weak var dateTextButton: UIButton!
    @IBOutlet weak var timeTextButton: UIButton!
    @IBOutlet weak var hungerBeforeSlider: UISlider!
    @IBOutlet weak var hungerAfterSlider: UISlider!
    @IBOutlet weak var whatIAteCell: UITableViewCell!
    
    //embeededViewControllers
    private var listFoodTableViewController: ListFoodTableViewController!
    private var reactionsCollectionViewController: ReactionsCollectionViewController!
    var foods = [Food]()
    var selectedDate = Date()
    var selectedFeeling: Feeling?
    
    var onNewMealSaved: OnNewMealSaved?
    
  
    @IBAction func onSaveButtonClicked(_ sender: Any) {
        let hungerBefore = Int(hungerBeforeSlider.value)
        let hungerAfter = Int(hungerAfterSlider.value)
        let foods = self.foods
        let meal = Meal(date: selectedDate, foods: foods, hungryBefore: hungerBefore, hungryAfter: hungerAfter, feeling: selectedFeeling!)
//        mealController.onNewMeal(meal)
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
    
    @IBAction func onSliderValueChanges(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
    }
    override func viewWillAppear(_ animated: Bool) {
        updateDateTimeLabels()
    }
    func updateDateTimeLabels(){
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
    
    private func openDatePickerActionSheet(){
       openDateActionSheet(.date)
    }
    
    private func openTimePickerActionSheet(){
       openDateActionSheet(.time)
    }
    private func openDateActionSheet(_ mode: UIDatePickerMode){
        var items = [CustomizableActionSheetItem]()
        let sampleViewItem = CustomizableActionSheetItem()
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(RegisterMealViewController.datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.setDate(self.selectedDate, animated: true)
        datePicker.backgroundColor = UIColor.white
        sampleViewItem.type = .view
        sampleViewItem.view = datePicker
        sampleViewItem.height = 250
        items.append(sampleViewItem)
        datePicker.datePickerMode = mode
        let actionSheet = CustomizableActionSheet()
        actionSheet.showInView(self.view, items: items)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        self.selectedDate =  sender.date
        updateDateTimeLabels()
    }
}
