//
//  FoodHttpService.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 12/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import Alamofire
class FoodHttpService{
    private let FETCH_FOODS_LIST = "https://gist.githubusercontent.com/eduardossampaio/b0ad47d9a44a539106658eccbaefdd4d/raw/4ffe6b2574361a695475db6aab59beb6dff6cb43/food.json"
   
    static var foodList = [Food]()
    typealias OnFetchFinished = (([Food]?,String?) -> Void)

    
    func fetchFromWeb(onFetchFinished : OnFetchFinished?){
        let foodListEndpoint: String = FETCH_FOODS_LIST
        Alamofire.request(foodListEndpoint)
            .responseJSON { response in
                if ( response.response?.statusCode != 200){
                    onFetchFinished?(nil, "Houve um erro ao recuperar a lista de alimentos, por favor insira-os manualmente" )
                    return;
                }
                if let data = response.data{
                    do {
                        try FoodHttpService.foodList = JSONDecoder().decode([Food].self, from: data)
                        onFetchFinished?(FoodHttpService.foodList,nil)
                    }catch {
                        onFetchFinished?([Food](),nil)
                    }
                }
        }
    }
}
