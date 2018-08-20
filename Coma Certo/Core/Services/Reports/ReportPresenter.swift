//
//  ReportPresenter.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 19/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
protocol ReportPresenter : ViewPresenter{
    func displayReport(asPdf pdf:Data)
}
