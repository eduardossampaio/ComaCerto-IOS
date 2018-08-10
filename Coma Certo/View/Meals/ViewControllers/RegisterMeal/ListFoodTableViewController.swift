//
//  ListFoodTableViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 09/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import UIKit
class ListFoodTableViewController : UITableViewController{
    
    let foodList = ["Arroz","Feijão","Carne","Ovo","Frango","Salada"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell")
        cell?.textLabel?.text = foodList[indexPath.item]
        return cell!
    }
    
}
