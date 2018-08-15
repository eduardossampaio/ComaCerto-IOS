//
//  GenerateReportViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 15/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
class GenerateReportViewController : UIViewController{
    
    @IBOutlet weak var initialDateLabel: UILabel!
    @IBOutlet weak var finalDateLabel: UILabel!
    
    private var initialDate = Date().startOfMonth()
    private var finalDate = Date().endOfMonth()
    
    private let INITIAL_DATE_TAG  = 111
    private let FINAL_DATE_TAG  = 222
    
    @IBAction func generateReportClicked(_ sender: Any) {
        performSegue(withIdentifier: "goToReportResultSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        initialDateLabel.isUserInteractionEnabled = true
        finalDateLabel.isUserInteractionEnabled = true
        initialDateLabel.addGestureRecognizer( UITapGestureRecognizer(target: self, action: #selector(initialDateLabelClicked)))
        finalDateLabel.addGestureRecognizer( UITapGestureRecognizer(target: self, action: #selector(finalDateLabelClicked)))
        updateDateLabels()
    }
    
    @objc func initialDateLabelClicked(sender: UITapGestureRecognizer){
        openDateActionSheet(date: initialDate, mode: UIDatePickerMode.date,tag: INITIAL_DATE_TAG)
    }
    
    @objc func finalDateLabelClicked(sender: UITapGestureRecognizer){
       openDateActionSheet(date: finalDate, mode: UIDatePickerMode.date,tag: FINAL_DATE_TAG)
    }
    
    @objc override func datePickerValueChanged(_ sender: UIDatePicker){
        if ( sender.tag == INITIAL_DATE_TAG){
            initialDate = sender.date
        }else if(sender.tag == FINAL_DATE_TAG){
            finalDate = sender.date
        }
        updateDateLabels()
    }
    
    private func updateDateLabels(){
        initialDateLabel.text = initialDate.toReadableDate(style: .short)
        finalDateLabel.text = finalDate.toReadableDate(style: .short)
    }
    
}
