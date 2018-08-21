//
//  ReportService.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 19/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import Alamofire
class ReportService : ReportIteractor {
    var reportPresenter: ReportPresenter
    let mealPersistence = MealPersistence()
    
    let GENERATE_MEALS_REPORT_URL = "https://coma-certo.herokuapp.com/reports/meals"
//    let GENERATE_MEALS_REPORT_URL = "http://192.168.1.102:8080/reports/meals"
    init(presenter: ReportPresenter ){
        self.reportPresenter = presenter
    }
    
    func generateReportClicked(initialDate: Date, finalDate: Date) {
        reportPresenter.showLoading()
        generateReport(initialDate: initialDate, finalDate: finalDate)
    }
    
    func generateReport(initialDate: Date,finalDate:Date){
        let meals = mealPersistence.getMeals(initialDate: initialDate,finalDate:finalDate)
        let mealRequest = MealReportRequest(initialDate,finalDate,meals)
        var mealsJson : Data?
        do {
            let decoder = JSONEncoder()
            mealsJson  = try decoder.encode(mealRequest)
        } catch {
            // No-op
        }

        var request = URLRequest(url: URL(string: GENERATE_MEALS_REPORT_URL)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = mealsJson
        
        Alamofire.request(request).responseData{ response in
            self.reportPresenter.hideLoading()
            guard response.response?.statusCode == 200 else {
                self.reportPresenter.showError(message: "Erro ao gerar relatório alimentar")
                return
            }
            if let pdfData = response.result.value{
                self.reportPresenter.displayReport(asPdf: pdfData)
            }
        }
        
    }

}
