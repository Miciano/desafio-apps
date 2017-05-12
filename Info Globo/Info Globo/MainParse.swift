//
//  MainParse.swift
//  Info Globo
//
//  Created by Fabio Miciano on 12/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation


import Foundation

enum ParseErros: Error {
    case invalidInput
}

protocol MainParse {
    func parserNotice(response: [String: Any]?)-> NoticeModel?
}

extension MainParse {
    
    func parserNotice(response: [String: Any]?)-> NoticeModel? {
        guard let response = response else { return nil }
        return try? NoticeModel(info: response)
    }
}
