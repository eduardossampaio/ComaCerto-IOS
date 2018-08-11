//
//  ListFoodTableViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 09/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import UIKit
class ListFoodTableViewController : UITableViewController{
    typealias OnFoodListUpdate = ( ([String])->Void )

    var foodList = [String]()
    var onFoodListUpdate:OnFoodListUpdate?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell")
        cell?.textLabel?.text = foodList[indexPath.item]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.foodList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            onFoodListUpdate?(foodList)
        }
    }
    
}
