//
//  ViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 07/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import UIKit

class DailyMealsViewController: UIViewController {

    @IBAction func onNewMealClicked(_ sender: Any) {
        performSegue(withIdentifier: "NewMealSegue", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

