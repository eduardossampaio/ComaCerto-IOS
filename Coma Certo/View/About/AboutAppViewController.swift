//
//  AboutAppViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 19/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
class AboutAppViewController : UITableViewController{
    
    var aboutAppInfo: NSDictionary!
    var detailText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "about", ofType: "plist"),  let myDict = NSDictionary(contentsOfFile: path){
            self.aboutAppInfo = myDict
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            detailText = aboutAppInfo["about-app"] as! String
        case 1:
            detailText = aboutAppInfo["general-rules"] as! String
        case 2:
            detailText = aboutAppInfo["how-to-input"] as! String
        case 3:
            detailText = aboutAppInfo["credits"] as! String
        default:
            detailText = "Sem informacoes"
        }
        
        performSegue(withIdentifier: "goToAboutAppDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAboutAppDetailSegue" {
            let controller = segue.destination as! AboutAppInfoViewController
            controller.resourceFileName = self.detailText
        }
    }
}
