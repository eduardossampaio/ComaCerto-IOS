//
//  DisplayReportViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 19/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
import PDFKit
class DisplayReportViewController : UIViewController{
    var pdfData : Data?
    var pdfView : PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfView =  PDFView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)

        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pdfView.autoScales = true
        self.view.addSubview(pdfView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let pdfData = self.pdfData , let document = PDFDocument(data: pdfData){
            self.pdfView.document = document
        }
    }
    
    @IBAction func shareReportClicked(_ sender: Any) {
     
    }
}
