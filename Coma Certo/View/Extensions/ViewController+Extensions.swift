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
