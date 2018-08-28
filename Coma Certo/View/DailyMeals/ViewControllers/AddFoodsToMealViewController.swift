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
class AddFoodsToMealViewController : UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, FoodPresenter{
    
    typealias OnFoodListUpdate = ( ([Food])->Void )
    
    @IBOutlet weak var addFoodsTextField: SearchTextField!
    @IBOutlet weak var foodsTableView: UITableView!
    
    var onFoodListUpdate:OnFoodListUpdate? = nil
    var allFoodsList = [Food]()
    var selectedFoods = [Food]()
    var itemToAdd = ""
    var foodIteractor:FoodIteractor!
    
    override func viewDidLoad() {
        self.foodIteractor = FoodService(presenter: self)
        super.viewDidLoad()
        addFoodsTextField.autocorrectionType = .default
        addFoodsTextField.theme.bgColor = UIColor (red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        addFoodsTextField.theme.cellHeight = 50
        addFoodsTextField.theme.font = UIFont.systemFont(ofSize: 17.0)
        addFoodsTextField.returnKeyType = .next
    }
    func updateFoodList(foodsList: [Food]) {
        allFoodsList = foodsList
        setupPreValues()
    }
    
    func updateSelectedFoodList(foodsList: [Food]) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        foodIteractor.onScreenLoad()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        onFoodListUpdate?(selectedFoods)
    }
   
    private func setupPreValues(){
        var searchItems = [SearchTextFieldItem]()
        for food in allFoodsList{
            let item = SearchTextFieldItem(title: food.name,  subtitle: food.category)
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
        let cell =  tableView.dequeueReusableCell(withIdentifier: "foodCell") as! AddFoodListCellView
        cell.foodNameLabel.text = selectedFoods[indexPath.item].name
        let portion = selectedFoods[indexPath.item].portion ?? 1
        cell.portionQuantityLabel.text = String(portion)
        cell.portionQuantityStepper.value = Double(portion)
        cell.onPortionQuantityChange = { newPortion in
            self.selectedFoods[indexPath.item].portion = newPortion
            self.foodsTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
        }
        return cell;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        selectedFoods.insert(getFoodOrCreateNew(foodName:self.itemToAdd), at: 0)
        textField.text = ""
        itemToAdd = ""
        foodsTableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text{
            self.itemToAdd = text
            return text.isEmpty == false
        }else{
            return false
        }
    }
    
    private func getFoodOrCreateNew(foodName: String) -> Food{
        for food in allFoodsList {
            if (food.name == foodName){
//                food.portion = 1
                return food
            }
        }
        return Food(name: foodName,category: "Meus Alimentos")
        //salvar alimento
    }
    
}

