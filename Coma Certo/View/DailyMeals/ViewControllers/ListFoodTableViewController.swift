//
//  ListFoodTableViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 09/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import UIKit
class ListFoodTableViewController : UITableViewController{
    typealias OnFoodListUpdate = ( ([Food])->Void )
    typealias OnAddNewFoodClicked = ( ()->Void )

    
    var foodList = [Food]()
    var onFoodListUpdate:OnFoodListUpdate?
    var onAddNewFoodClicked:OnAddNewFoodClicked?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.item == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddFoodsCell")
            return cell!
        }else{
            let foodIndex = indexPath.item - 1
            let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell")
            cell?.textLabel?.text = foodList[foodIndex].name
            let portion = foodList[foodIndex].portion ?? 1
            cell?.detailTextLabel?.text = String(portion)
            return cell!
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if ( self.foodList.isEmpty == false){
                self.foodList.remove(at: indexPath.item - 1)
                tableView.deleteRows(at: [indexPath], with: .fade)
                onFoodListUpdate?(foodList)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if ( indexPath.item == 0){
            return false
        }
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ( indexPath.section == 0 && indexPath.item == 0){
            onAddNewFoodClicked?()
        }
    }
    
}
