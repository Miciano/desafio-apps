//
//  MainParse.swift
//  Info Globo
//
//  Created by Fabio Miciano on 12/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation

enum ParseErros: Error {
    case invalidInput
}

protocol MainParse {
    func parserContent(response: [[String: Any]]?)-> [ContentModel]?
}

extension MainParse {
    
    func parserContent(response: [[String: Any]]?)-> [ContentModel]? {
        guard let response = response else { return nil }
        
        let info: [[[String: Any]]] = response.flatMap {
            return $0.contentKey
        }
        
        let model: [ContentModel] = info.flatMap {
            return try? ContentModel(info: $0)
        }
        
        return model
    }
}
