//
//  ViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 07/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import UIKit
import Foundation
class DailyMealsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, MealPresenter{
    
    
    @IBOutlet weak var dateTextView: UILabel!
    @IBOutlet weak var weekDayTextView: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    var selectedDate = Date()
    var meals = [Meal]()
    var lastClickedMeal : Meal?
    
    var mealIteractor : MealIteractor!
    
    @IBAction func onNewMealClicked(_ sender: Any) {
        self.lastClickedMeal = nil
        performSegue(withIdentifier: "NewMealSegue", sender: nil)
    }
    
    @IBAction func onPreviousButtonClicked(_ sender: Any) {
        decreaseDate()
        updateDateLabels()
        mealIteractor.dateSelected(date: self.selectedDate)
    }
    
    @IBAction func onNextButtonClicked(_ sender: Any) {
        increaseDate()
        updateDateLabels()
        mealIteractor.dateSelected(date: self.selectedDate)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let meal = self.meals[indexPath.row]
            mealIteractor.onDeletePressed(meal: meal)
            self.meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell") as! ListMealCellView
        let meal = meals[indexPath.item]
        cell.mealImage.image = (meal.mealType?.displayImage())!
        cell.mealNameTextField.text = meal.mealType?.displayName()
        cell.mealHourTextField.text = meal.date.toReadableTime()
        if ( meal.foods.isEmpty){
            cell.mealInfoTextField.text = "Adicione alimentos"
            cell.mealInfoTextField.textColor = UIColor.red
        }else{
            cell.mealInfoTextField.text = "\(meal.foods.count) alimento(s)"
            cell.mealInfoTextField.textColor = UIColor.black
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.lastClickedMeal = self.meals[indexPath.row]
        performSegue(withIdentifier: "NewMealSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "NewMealSegue" {
            let navigationController = segue.destination as! UINavigationController
            let controller =  navigationController.viewControllers.first as! RegisterMealViewController
            if let lastClickedMeal = self.lastClickedMeal{
                controller.meal = lastClickedMeal
            }else{
                controller.meal = Meal()
                controller.meal.date = self.selectedDate
            }
            controller.onNewMealSaved = { (meal) in
                self.mealIteractor.onSavePressed(meal: meal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        updateDateLabels()
        self.mealIteractor = MealService(mealPresenter: self)
        mealIteractor.dateSelected(date: self.selectedDate)
    }
   
    private func increaseDate(){
        selectedDate =  calendar.date(byAdding: Calendar.Component.day, value: 1, to: selectedDate)!
    }
    private func decreaseDate(){
          selectedDate =  calendar.date(byAdding: Calendar.Component.day, value: -1, to: selectedDate)!
    }
    private func updateDateLabels(){
        dateTextView.text = selectedDate.toReadableDate()
        weekDayTextView.text = selectedDate.toReadableWeekDay()
    }

    func updateMealList(meals: [Meal]) {
        self.meals = meals
        self.tableView.reloadData()
    }
    

}

