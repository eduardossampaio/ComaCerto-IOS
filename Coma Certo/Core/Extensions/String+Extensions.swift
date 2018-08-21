//
//  String+Extensions.swift
//  Coma Certo
//
//  Created by Eduardo Soares on 21/08/2018.
//  Copyright © 2018 Eduardo Soares. All rights reserved.
//

import Foundation

extension String {
    
    func appendPath(_ path:String) -> String{
        let slash = self.hasSuffix("/") ? "" : "/"
        return "\(self)\(slash)\(path)"
    }
}
