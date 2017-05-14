//
//  ContentModel.swift
//  Info Globo
//
//  Created by Fabio Miciano on 13/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation

struct ContentModel {
    var notices: [NoticeModel]
    
    init(info: [[String: Any]]) throws {
        
        let notices: [NoticeModel] = info.flatMap {
            return try? NoticeModel(info: $0)
        }
        
        if notices.count == 0 { throw ParseErros.invalidInput }
        
        self.notices = notices
    }
}
