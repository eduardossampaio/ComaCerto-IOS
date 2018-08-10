//
//  ViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 07/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import UIKit
import Foundation
class DailyMealsViewController: UIViewController {

    @IBOutlet weak var dateTextView: UILabel!
    @IBOutlet weak var weekDayTextView: UILabel!
    
    let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    var selectedDate = Date()
    
    @IBAction func onNewMealClicked(_ sender: Any) {
        performSegue(withIdentifier: "NewMealSegue", sender: nil)
    }
    
    @IBAction func onPreviousButtonClicked(_ sender: Any) {
        decreaseDate()
        updateDateLabels()
    }
    
    @IBAction func onNextButtonClicked(_ sender: Any) {
        increaseDate()
        updateDateLabels()
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

