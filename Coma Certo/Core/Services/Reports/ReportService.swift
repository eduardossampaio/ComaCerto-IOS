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
    
    let GENERATE_MEALS_REPORT_URL = "http://192.168.1.102:8080/reports/meals"
    
    init(presenter: ReportPresenter ){
        self.reportPresenter = presenter
    }
    
    func generateReportClicked(initialDate: Date, finalDate: Date) {
        reportPresenter.showLoading()
        generateReport(initialDate: initialDate, finalDate: finalDate)
    }
    
    func generateReport(initialDate: Date,finalDate:Date){
        let meals = mealPersistence.getMeals(initialDate: initialDate,finalDate:finalDate)
        let parameters = [
            "initialDate": initialDate.formatDate(format: "dd/MM/yyyy"),
            "finalDate": finalDate.formatDate(format: "dd/MM/yyyy"),
            "meals": meals
        ] as [String : Any]
        Alamofire.request(GENERATE_MEALS_REPORT_URL,  method: .post, parameters:parameters,encoding: JSONEncoding.default).response{ response in
            self.reportPresenter.hideLoading()
            guard response.response?.statusCode == 200 else {
                self.reportPresenter.showError(message: "Erro ao gerar relatório alimentar")
                return
            }
            if let pdfData = response.data{
                self.reportPresenter.displayReport(asPdf: pdfData)
            }
        }
        
    }

}
