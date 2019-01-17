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
import DateTimePicker
extension UIViewController : ViewPresenter {
  
    
    static let SPINNER_VIEW_TAG = 1234;
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Coma Certo", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)

    }
    func getFistViewControllerInStack(from viewController :UIViewController) -> UIViewController?{
        let currentParent = viewController.parent;
        if ( currentParent == nil){
            return viewController
        }
        return getFistViewControllerInStack(from: currentParent!)
    }
    
    func showLoading() {
        if let parentViewController = getFistViewControllerInStack(from: self) , let view = parentViewController.view{
            let spinnerView = UIView.init(frame: view.bounds)
            spinnerView.tag = UIViewController.SPINNER_VIEW_TAG
            spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
            let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
            ai.startAnimating()
            ai.center = spinnerView.center
            
            DispatchQueue.main.async {
                spinnerView.addSubview(ai)
                view.addSubview(spinnerView)
            }
           
        }
    }
    
    func hideLoading() {
       if let parentViewController = getFistViewControllerInStack(from: self) , let view = parentViewController.view{
            for subview in view.subviews {
                if ( subview.tag == UIViewController.SPINNER_VIEW_TAG){
                    DispatchQueue.main.async {
                        subview.removeFromSuperview()
                    }
                    break;
                }
            }
        }
    }
    
    func openDateActionSheet(date:Date, mode: UIDatePickerMode, tag: Int = 0){

        let min = Date().addingTimeInterval(-60 * 60 * 24 * 300)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 300)
        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max)
        
        if mode == UIDatePickerMode.date{
            picker.isDatePickerOnly = true
            picker.dateFormat = "dd/MM/yyyy"
            picker.todayButtonTitle = "Hoje"
        }else if mode ==  UIDatePickerMode.time{
            picker.isTimePickerOnly = true
            picker.dateFormat = "HH:mm"
            picker.todayButtonTitle = "Agora"
        }
        picker.tag = tag
        picker.selectedDate = date
        picker.cancelButtonTitle = "Cancelar"
        picker.doneButtonTitle = "Confirmar"
        picker.completionHandler = { date in
            self.datePickerValueChanged(tag: picker.tag,date: date)
        }
        picker.show()
    }

    
    @objc func datePickerValueChanged(tag: Int,date:Date){
    }
}
