//
//  SettingsViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 24/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
class  SettingsViewController : UITableViewController, SettingsPresenter{
    
    private let BREAKFAST_TIME_PICKER_TAG   = 1111
    private let LUNCH_TIME_PICKER_TAG       = 2222
    private let SNACK_TIME_PICKER_TAG       = 3333
    private let DINNER_PICKER_TAG           = 4444
    
    @IBOutlet weak var addReminderSwitch: UISwitch!
    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var lunchLabel: UILabel!
    @IBOutlet weak var snackLabel: UILabel!
    @IBOutlet weak var dinnerLabel: UILabel!
    
    var settingsIteractor : SettingsIteractor!
    
    func setNotificationsEnabled(_ enabled: Bool) {
        addReminderSwitch.isOn = enabled
    }
    override func viewDidLoad() {
        settingsIteractor = SettingsService(presenter: self)
        settingsIteractor.onScreenLoaded()
    }
    override func viewDidDisappear(_ animated: Bool) {
        settingsIteractor.onScreenClose()
    }
    
    func updateNotificationHour(hour: Date, for mealType: MealType) {
        if mealType.equals(other: MealType.breakfast){
            breakfastLabel.text = hour.toReadableTime()
        }else if mealType.equals( other: MealType.lunch){
            lunchLabel.text = hour.toReadableTime()
        }else if mealType.equals( other: MealType.snack){
            snackLabel.text = hour.toReadableTime()
        }else if mealType.equals( other: MealType.dinner){
            dinnerLabel.text = hour.toReadableTime()
        }
    }
  
    @IBAction func onAddRememberSwitchChange(_ sender: UISwitch) {
        settingsIteractor.onScheduleNotificationsChange(sender.isOn)
        self.tableView.reloadData()
    }
    
    func openBreakfastTimeActionSheet() {
        openActionDateSheet(for: breakfastLabel, with: BREAKFAST_TIME_PICKER_TAG)
    }
    
    func openLunckTimeActionSheet() {
        openActionDateSheet(for: lunchLabel, with: LUNCH_TIME_PICKER_TAG)
    }
    
    func openSnackTimeActionSheet() {
        openActionDateSheet(for: snackLabel, with: SNACK_TIME_PICKER_TAG)
    }
    
    func openDinnerTimeActionSheet() {
         openActionDateSheet(for: dinnerLabel, with: DINNER_PICKER_TAG)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if !addReminderSwitch.isOn {
                return
            }
            if indexPath.item == 1{
                openBreakfastTimeActionSheet()
            }else if indexPath.item == 2{
                openLunckTimeActionSheet()
            }else if indexPath.item == 3{
                openSnackTimeActionSheet()
            }else if indexPath.item == 4{
                openDinnerTimeActionSheet()
            }
            
        }else if indexPath.section == 1 && indexPath.item == 0 {
            performSegue(withIdentifier: "goToManageFeelingsViewController", sender: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if indexPath.section == 0 && indexPath.item >= 1{
            let hourCell = cell as! SettingsHourCell
            if !addReminderSwitch.isOn{
                hourCell.mealName.textColor  = UIColor.gray
                hourCell.hourLabel.textColor  = UIColor.gray
            }else{
                hourCell.mealName.textColor = UIColor.black
                hourCell.hourLabel.textColor  = UIColor.blue
            }
        }
        return cell
    }
    
    private func openActionDateSheet(for label: UILabel, with tag: Int){
        let timeToDisplay = Date.fromFormat(format: "HH:mm", formattedDate: label.text ?? "") ?? Date()
        openDateActionSheet(date: timeToDisplay, mode: .time, tag: tag)
    }
    
    override func datePickerValueChanged(tag: Int,date:Date){
        let timeText =  date.formatDate(format: "HH:mm")
        if tag == BREAKFAST_TIME_PICKER_TAG {
            breakfastLabel.text =  timeText
            settingsIteractor.onNotificationAlarmChanged(mealType: MealType.breakfast, hour: date)
        }else if tag == LUNCH_TIME_PICKER_TAG {
            lunchLabel.text = timeText
            settingsIteractor.onNotificationAlarmChanged(mealType: MealType.lunch, hour: date)
        }else if tag == SNACK_TIME_PICKER_TAG {
            snackLabel.text =  timeText
            settingsIteractor.onNotificationAlarmChanged(mealType: MealType.snack, hour: date)
        }else if tag == DINNER_PICKER_TAG {
            dinnerLabel.text =  timeText
            settingsIteractor.onNotificationAlarmChanged(mealType: MealType.dinner, hour: date)
        }
    }
    
}
