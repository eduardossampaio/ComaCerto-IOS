//
//  AddFoodToMealViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 10/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
import SearchTextField
//https://github.com/apasccon/SearchTextField
class AddFoodsToMealViewController : UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    typealias OnFoodListUpdate = ( ([String])->Void )
    
    @IBOutlet weak var addFoodsTextField: SearchTextField!
    @IBOutlet weak var foodsTableView: UITableView!
    
    var onFoodListUpdate:OnFoodListUpdate? = nil
    
    var foods  = ["Arroz","Feijão","Carne","Ovo","Frango","Salada"]
    var selectedFoods = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFoodsTextField.theme.bgColor = UIColor (red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        addFoodsTextField.theme.cellHeight = 50
        addFoodsTextField.theme.font = UIFont.systemFont(ofSize: 17.0)
        setupPreValues()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        onFoodListUpdate?(selectedFoods)
    }
    private func setupPreValues(){
        var searchItems = [SearchTextFieldItem]()
        for food in foods{
            let item = SearchTextFieldItem(title: food,  subtitle: "Alimentos")
            searchItems.append(item)
        }
        addFoodsTextField.filterItems(searchItems)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedFoods.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.selectedFoods.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "foodCell")!
        cell.textLabel?.text = selectedFoods[indexPath.item]
        return cell;
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let foodName = textField.text{
            selectedFoods.insert(foodName, at: 0)
            textField.text = ""
            foodsTableView.reloadData()
        }
    }
    
}
