//
//  MainResponses.swift
//  Info Globo
//
//  Created by Fabio Miciano on 12/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation

enum NoticeResponse {
    case success(model: NoticeModel?)
    case serverError(description: ServerError)
    case timeOut(description: ServerError)
    case noConnection(description: ServerError)
    case invalidResponse
}
