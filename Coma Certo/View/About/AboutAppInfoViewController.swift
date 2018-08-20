//
//  AboutAppInfoViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 20/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
class AboutAppInfoViewController : UIViewController{
    
    @IBOutlet weak var infoTextView: UITextView!
    
    var detailText = ""
    
    override func viewWillAppear(_ animated: Bool) {
        self.infoTextView.text = detailText
    }
}
