//
//  Constraints.swift
//  Info Globo
//
//  Created by Fabio Miciano on 15/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

//PROTOCOLO CRIADO PAR ADICIONAR CONSTRAINTS DE FORMA MANUAL

protocol Constraints {
    func addConstraints(_ item: AnyObject?, toItem: AnyObject, attributes:[NSLayoutAttribute], constants:[CGFloat])
}

extension Constraints {
    
    func addConstraints(_ item: AnyObject?, toItem: AnyObject, attributes:[NSLayoutAttribute], constants:[CGFloat]) {
        guard let item = item  as? UIView else { return }
        
        var aux = 0
        var arrayContraints = [NSLayoutConstraint]()
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        for attribute in attributes {
            let constraint = NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .equal, toItem: toItem, attribute: attribute, multiplier: 1.0, constant: constants[aux])
            arrayContraints.append(constraint)
            aux += 1
        }
        
        toItem.addConstraints(arrayContraints)
    }
    
}
