//
//  GenerateReportViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 15/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
class GenerateReportViewController : UIViewController, ReportPresenter{
    
    @IBOutlet weak var initialDateLabel: UILabel!
    @IBOutlet weak var finalDateLabel: UILabel!
    
    private var initialDate = Date().startOfMonth()
    private var finalDate = Date().endOfMonth()
    
    private let INITIAL_DATE_TAG  = 111
    private let FINAL_DATE_TAG  = 222
    
    private var reportIteractor : ReportIteractor!
    private var pdfToDisplay: Data?
    
    @IBAction func generateReportClicked(_ sender: Any) {
        reportIteractor.generateReportClicked(initialDate: self.initialDate, finalDate: self.finalDate)
    }
    
    override func viewDidLoad() {
        initialDateLabel.isUserInteractionEnabled = true
        finalDateLabel.isUserInteractionEnabled = true
        initialDateLabel.addGestureRecognizer( UITapGestureRecognizer(target: self, action: #selector(initialDateLabelClicked)))
        finalDateLabel.addGestureRecognizer( UITapGestureRecognizer(target: self, action: #selector(finalDateLabelClicked)))
        updateDateLabels()
        self.reportIteractor = ReportService(presenter: self)
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
    func displayReport(asPdf pdf: Data) {
        pdfToDisplay = pdf
        performSegue(withIdentifier: "goToReportResultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "goToReportResultSegue"){
            let controller = segue.destination as! DisplayReportViewController
            controller.pdfData = self.pdfToDisplay
            controller.initialDate = self.initialDate
            controller.finalDate = self.finalDate
        }
    }
    
}
