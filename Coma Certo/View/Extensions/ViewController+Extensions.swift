//
//  ViewController+Extensions.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 15/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
import CustomizableActionSheet
extension UIViewController : ViewPresenter {
    func showAlert(message: String) {
        
    }
    
    func showErrpr(message: String) {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func openDateActionSheet(date:Date, mode: UIDatePickerMode, tag: Int = 0){
        var items = [CustomizableActionSheetItem]()
        let sampleViewItem = CustomizableActionSheetItem()
        let datePicker = UIDatePicker()
        datePicker.tag = tag
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.setDate(date, animated: true)
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
    }
}
