//
//  ViewPresenter.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 15/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
protocol ViewPresenter {
    
    func showAlert(message:String)
    
    func showErrpr(message: String)
    
    func showLoading()
    
    func hideLoading()
}
