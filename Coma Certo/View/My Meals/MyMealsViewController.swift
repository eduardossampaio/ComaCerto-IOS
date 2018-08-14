//
//  MyMealsViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 14/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import UIKit
class MyPresetMealsViewController: UIViewController {
    
    @IBAction func onNewPresetMealClicked(_ sender: Any) {
        performSegue(withIdentifier: "addNewPresetMealSegue", sender: nil)
    }
}
