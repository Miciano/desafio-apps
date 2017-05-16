//
//  NoticeModel.swift
//  Info Globo
//
//  Created by Fabio Miciano on 11/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation

struct NoticeModel {
    var autors: [String]
    var advertisingReport: Bool
    var subTitle: String
    var text: String
    var updatedAt: String
    var id: Int
    var publishedAt: String
    var section: SectionModel?
    var type: String
    var title: String
    var url: String
    var urlOriginal: String
    var imagens: [ImageModel]
    
    init(info: [String: Any]) throws {

        guard let autors = info.autorsKey,
            let advertisingReport = info.advertisingReportKey,
            let subTitle = info.subTitleKey,
            let text = info.textKey,
            let updatedAt = info.updatedAtKey,
            let id = info.idKey,
            let publishedAt = info.publishedAtKey,
            let section = info.sectionKey,
            let type = info.typeKey,
            let title = info.titleKey,
            let url = info.urlKey,
            let urlOriginal = info.urlOriginalKey,
            let imagesList = info.imagesKey else { throw ParseErros.invalidInput }
        
        
        let images: [ImageModel] = imagesList.flatMap {
            return try? ImageModel(info: $0)
        }
        
        self.autors = autors
        self.advertisingReport = advertisingReport
        self.subTitle = subTitle
        self.text = text
        self.updatedAt = updatedAt
        self.id = id
        self.publishedAt = publishedAt
        self.section = try? SectionModel(info: section)
        self.type = type
        self.title = title
        self.url = url
        self.urlOriginal = urlOriginal
        self.imagens = images
    }
}
