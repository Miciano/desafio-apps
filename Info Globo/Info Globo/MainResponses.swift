//
//  MainResponses.swift
//  Info Globo
//
//  Created by Fabio Miciano on 12/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

enum NoticeResponse {
    case success(model: [ContentModel]?)
    case serverError(description: ServerError)
    case timeOut(description: ServerError)
    case noConnection(description: ServerError)
    case cancelled
    case invalidResponse
}

enum ImageResponse {
    case success(model: UIImage)
    case downloadCanceled(description: ServerError)
    case invalidResponse
}
