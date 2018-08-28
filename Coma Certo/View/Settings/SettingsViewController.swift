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
class  SettingsViewController : UITableViewController {
    private let BREAKFAST_TIME_PICKER_TAG   = 1111
    private let LUNCH_TIME_PICKER_TAG       = 2222
    private let SNACK_TIME_PICKER_TAG       = 3333
    private let DINNER_PICKER_TAG           = 4444
    
    @IBOutlet weak var addReminderSwitch: UISwitch!
    @IBOutlet weak var breakfastButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var snackButton: UIButton!
    @IBOutlet weak var dinnerButton: UIButton!
    
    override func viewDidLoad() {
        addReminderSwitch.isOn = Preferences.instance.remindersEnabled
        breakfastButton.setTitle(Preferences.instance.breakfastHour, for: .normal)
        lunchButton.setTitle( Preferences.instance.lunchHour, for: .normal)
        snackButton.setTitle( Preferences.instance.snackHour, for: .normal)
        dinnerButton.setTitle( Preferences.instance.dinnerHour, for: .normal)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
//
//        let center = UNUserNotificationCenter.current()
//        let content = UNMutableNotificationContent()
//        content.title = "Test"
//        var date = DateComponents()
//        date.hour = 19  // 8 AM
//        date.minute = 32
//        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
//        
//        let identifier = "UYLLocalNotification"
//                    let request = UNNotificationRequest(identifier: identifier,
//                                                        content: content, trigger: trigger)
//                    center.add(request, withCompletionHandler: { (error) in
//                        if let error = error {
//                            // Something went wrong
//                            print(error)
//                        }
//                    })
////        }
    }
    @IBAction func onAddRememberSwitchChange(_ sender: UISwitch) {
        Preferences.instance.remindersEnabled = sender.isOn
        self.tableView.reloadData()
    }
    
    func openBreakfastTimeActionSheet() {
        openActionDateSheet(for: breakfastButton, with: BREAKFAST_TIME_PICKER_TAG)
    }
    
    func openLunckTimeActionSheet() {
        openActionDateSheet(for: lunchButton, with: LUNCH_TIME_PICKER_TAG)
    }
    
    func openSnackTimeActionSheet() {
        openActionDateSheet(for: snackButton, with: SNACK_TIME_PICKER_TAG)
    }
    
    func openDinnerTimeActionSheet() {
         openActionDateSheet(for: dinnerButton, with: DINNER_PICKER_TAG)
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
                hourCell.hourButton.tintColor  = UIColor.gray
            }else{
                hourCell.mealName.textColor = UIColor.black
                hourCell.hourButton.tintColor  = UIColor.blue
            }
        }
        return cell
    }
    
    private func openActionDateSheet(for button: UIButton, with tag: Int){
        let timeToDisplay = Date.fromFormat(format: "HH:mm", formattedDate: button.titleLabel?.text ?? "") ?? Date()
        openDateActionSheet(date: timeToDisplay, mode: .time, tag: tag)
    }
    
    override func datePickerValueChanged(_ sender: UIDatePicker) {
        let tag = sender.tag
        let timeText =  sender.date.formatDate(format: "HH:mm")
        if tag == BREAKFAST_TIME_PICKER_TAG {
            breakfastButton.setTitle( timeText, for: .normal)
            Preferences.instance.breakfastHour = timeText
        }else if tag == LUNCH_TIME_PICKER_TAG {
            lunchButton.setTitle( timeText, for: .normal)
            Preferences.instance.lunchHour = timeText
        }else if tag == SNACK_TIME_PICKER_TAG {
            snackButton.setTitle( timeText, for: .normal)
            Preferences.instance.snackHour = timeText
        }else if tag == DINNER_PICKER_TAG {
            dinnerButton.setTitle( timeText, for: .normal)
            Preferences.instance.dinnerHour = timeText
        }
    }
    
}
