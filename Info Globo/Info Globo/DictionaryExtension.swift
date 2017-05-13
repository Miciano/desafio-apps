//
//  DictionaryExtension.swift
//  Info Globo
//
//  Created by Fabio Miciano on 11/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any {
    
    var contentKey: [String: Any]? {
        return self["conteudos"] as? [String: Any]
    }
    
    var autorsKey: [String]? {
        return self["autores"] as? [String]
    }
    
    var advertisingReportKey: Bool? {
        return self["informePublicitario"] as? Bool
    }
    
    var subTitleKey: String? {
        return self["subTitulo"] as? String
    }
    
    var textKey: String? {
        return self["texto"] as? String
    }
    
    var updatedAtKey: String? {
        return self["atualizadoEm"] as? String
    }
    
    var idKey: Int? {
        return self["id"] as? Int
    }
    
    var publishedAtKey: String? {
        return self["publicadoEm"] as? String
    }
    
    var sectionKey: [String: Any]? {
        return self["secao"] as? [String: Any]
    }
    
    var typeKey: String? {
        return self["tipo"] as? String
    }
    
    var titleKey: String? {
        return self["titulo"] as? String
    }
    
    var urlKey: String? {
        return self["url"] as? String
    }
    
    var urlOriginalKey: String? {
        return self["urlOriginal"] as? String
    }
    
    var imagesKey: [[String: Any]]? {
        return self["imagens"] as? [[String: Any]]
    }
    
    var nameKey: String? {
        return self["nome"] as? String
    }
    
    var autorKey: String? {
        return self["autor"] as? String
    }
    
    var sourceKey: String? {
        return self["fonte"] as? String
    }
    
    var legendKey: String? {
        return self["legenda"] as? String
    }
}
