//
//  SettingsViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 24/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
class  SettingsViewController : UITableViewController {
    private let BREAKFAST_TIME_PICKER_TAG   = 1111
    private let LUNCH_TIME_PICKER_TAG       = 2222
    private let SNACK_TIME_PICKER_TAG       = 3333
    private let DINNER_PICKER_TAG           = 4444
    
    @IBOutlet weak var breakfastButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var snackButton: UIButton!
    @IBOutlet weak var dinnerButton: UIButton!
    
    @IBAction func onAddRememberSwitchChange(_ sender: UISwitch) {
       
    }
    
    @IBAction func onBreakfastTimeButtonClicked(_ sender: UIButton) {
        openActionDateSheet(for: breakfastButton, with: BREAKFAST_TIME_PICKER_TAG)
    }
    
    @IBAction func onLunckTimeButtonClicked(_ sender: UIButton) {
        openActionDateSheet(for: lunchButton, with: LUNCH_TIME_PICKER_TAG)
    }
    
    @IBAction func onSnackTimeButtonClicked(_ sender: UIButton) {
        openActionDateSheet(for: snackButton, with: SNACK_TIME_PICKER_TAG)
    }
    
    @IBAction func onDinnerTimeButtonClicked(_ sender: UIButton) {
         openActionDateSheet(for: dinnerButton, with: DINNER_PICKER_TAG)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.item == 0 {
            performSegue(withIdentifier: "goToManageFeelingsViewController", sender: nil)
        }
    }
    
    private func openActionDateSheet(for button: UIButton, with tag: Int){
        let timeToDisplay = Date.fromFormat(format: "HH:mm", formattedDate: button.titleLabel?.text ?? "") ?? Date()
        openDateActionSheet(date: timeToDisplay, mode: .time, tag: tag)
    }
}
