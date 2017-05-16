//
//  StringExtension.swift
//  Info Globo
//
//  Created by Fabio Miciano on 16/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation

extension String {
    
    func convertDate()-> String{
        let date = self.characters.split(separator: "T").map(String.init)
        let originalDayDataFormatter = DateFormatter()
        originalDayDataFormatter.dateFormat = "yyyy-MM-dd"
        let originalDayDate = originalDayDataFormatter.date(from: date[0]) ?? Date()
        
        //Crio uma string com o formato correto da date
        let newDayDateFormatter = DateFormatter()
        newDayDateFormatter.dateFormat = "dd/MM/yy"
        newDayDateFormatter.dateStyle = DateFormatter.Style.short
        newDayDateFormatter.locale = Locale(identifier: "pt")
        let newDayDate = newDayDateFormatter.string(from: originalDayDate)
        
        let hour = date[1].characters.split(separator: ":").map(String.init)
        
        return "\(newDayDate) \(hour[0]):\(hour[1])"
    }
}
