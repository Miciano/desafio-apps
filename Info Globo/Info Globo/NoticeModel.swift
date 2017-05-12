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
    var section: SectionModel
    var type: String
    var title: String
    var url: String
    var urlOriginal: String
    var imagens: [ImageModel]
    
    init(info: [String: Any]) throws {
        
        guard let autor = info.detailKey else { throw ParseErros.invalidInput }
        
        self.autors = [autor]
        self.advertisingReport = false
        self.subTitle = ""
        self.text = ""
        self.updatedAt = ""
        self.id = 0
        self.publishedAt = ""
        section = SectionModel()
        self.type = ""
        self.title = ""
        self.url = ""
        self.urlOriginal = ""
        self.imagens = [ImageModel()]
    }
}
