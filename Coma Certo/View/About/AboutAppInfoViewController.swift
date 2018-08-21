//
//  AboutAppInfoViewController.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 20/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation
import UIKit
//import MarkdownKit
import MarkdownView
class AboutAppInfoViewController : UIViewController{
    var resourceFileName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mdView = MarkdownView()
        view.addSubview(mdView)
        mdView.translatesAutoresizingMaskIntoConstraints = false
        mdView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        mdView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mdView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mdView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        

        if let path = Bundle.main.path(forResource: resourceFileName , ofType: "md") {
            let url = URL(fileURLWithPath: path)
            let markdown = try! String(contentsOf: url, encoding: String.Encoding.utf8)
            mdView.load(markdown: markdown, enableImage: true)
        }
    }

}
