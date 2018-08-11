//
//  ViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 07/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import UIKit
import Foundation
class DailyMealsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var dateTextView: UILabel!
    @IBOutlet weak var weekDayTextView: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    var selectedDate = Date()
    var meals = [Meal]()
    
    let mealController = MealController()
    
    @IBAction func onNewMealClicked(_ sender: Any) {
        performSegue(withIdentifier: "NewMealSegue", sender: nil)
    }
    
    @IBAction func onPreviousButtonClicked(_ sender: Any) {
        decreaseDate()
        updateDateLabels()
        refreshTableView()
    }
    
    @IBAction func onNextButtonClicked(_ sender: Any) {
        increaseDate()
        updateDateLabels()
        refreshTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell") as! ListMealCellView
        let meal = meals[indexPath.item]
        cell.descriptionTextField.text = meal.time?.toReadableTime()
        if let feeling = meal.feeling{
            cell.feelingImageView.image = UIImage(named: feeling.imageName )
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "NewMealSegue" {
            let navigationController = segue.destination as! UINavigationController
            let controller =  navigationController.viewControllers.first as! RegisterMealViewController
            controller.selectedDate = self.selectedDate
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        updateDateLabels()
        refreshTableView()
    }
    private func refreshTableView(){
        self.meals = mealController.listMeals(for: selectedDate)
        tableView.reloadData()
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


}

