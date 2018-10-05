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
    //selected period
    var initialDate: Date!
    var finalDate: Date!
    //for share document
    var documentName = "reports.pdf"
    var documentPath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfView =  PDFView(frame: view.frame)
        pdfView.autoScales = true
        pdfView.scaleFactor = pdfView.scaleFactorForSizeToFit
        self.view.addSubview(pdfView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let pdfData = self.pdfData , let document = PDFDocument(data: pdfData){
            self.pdfView.document = document
            documentName = "relatório alimentar de \(initialDate.toReadableDate()) ate \(finalDate.toReadableDate()).pdf"
        }
    }
    
    @IBAction func shareReportClicked(_ sender: Any) {
        if savePdf() {
            loadPDFAndShare()
        }else{
            showError(message: "Erro ao exportar relatório")
        }
    }
    
    func savePdf() -> Bool{
        let fileManager = FileManager.default
        documentPath = getDirectoryPath().appendPath(self.documentName)
        return fileManager.createFile(atPath: documentPath , contents: pdfData as Data?, attributes: nil)
    }
    
    func loadPDFAndShare(){
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: documentPath){
            let documentUrl = URL(fileURLWithPath: documentPath)
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [documentUrl], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView=self.view
            present(activityViewController, animated: true, completion: nil)
        }
        else {
             showError(message: "Erro ao exportar relatório")
        }
    }
    
    func getDirectoryPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
    }
}
