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
    init(presenter: ReportPresenter ){
        self.reportPresenter = presenter
    }
    
    func generateReportClicked(initialDate: Date, finalDate: Date) {
        generateReport(initialDate: initialDate, finalDate: finalDate)
    }
    
    func generateReport(initialDate: Date,finalDate:Date){
        let meals = mealPersistence.getMeals(initialDate: initialDate,finalDate:finalDate)
        if meals.isEmpty {
            reportPresenter.showError(message: "Não há refeições registradas no período selecionado")
            return
        }
        reportPresenter.showLoading()
        let mealRequest = MealReportRequest(initialDate,finalDate,meals)
        var mealsJson : Data?
        do {
            let decoder = JSONEncoder()
            mealsJson  = try decoder.encode(mealRequest)
        } catch {
            reportPresenter.showError(message: "Ocorreu um erro ao gerar o relatório alimentar")
        }

        var request = URLRequest(url: URL(string: GENERATE_MEALS_REPORT_URL)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.addValue("v1", forHTTPHeaderField: "version")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = mealsJson
        
        Alamofire.request(request).responseData{ response in
            self.reportPresenter.hideLoading()
            guard response.response?.statusCode == 200 else {
                self.reportPresenter.showError(message: "Ocorreu um erro ao gerar o relatório alimentar, Tente novamente mais tarde")
                return
            }
            if let pdfData = response.result.value{
                self.reportPresenter.displayReport(asPdf: pdfData)
            }
        }
        
    }

}
