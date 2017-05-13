//
//  SectionModel.swift
//  Info Globo
//
//  Created by Fabio Miciano on 11/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation


struct SectionModel {
    
    var name: String
    var url: String
    
    init(info: [String: Any]) throws {
        
        guard let name = info.nameKey,
            let url = info.urlKey else { throw ParseErros.invalidInput }
        
        self.name = name
        self.url = url
    }
}
