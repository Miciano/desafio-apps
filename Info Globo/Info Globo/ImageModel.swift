//
//  ImageModel.swift
//  Info Globo
//
//  Created by Fabio Miciano on 11/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation

struct ImageModel {
    
    var autor: String
    var source: String
    var legend: String
    var url: String
    
    init(info: [String: Any]) throws {
        
        guard let autor = info.autorKey,
            let source = info.sourceKey,
            let legend = info.legendKey,
            let url = info.urlKey else { throw ParseErros.invalidInput }
        
        self.autor = autor
        self.source = source
        self.legend = legend
        self.url = url
    }
}
