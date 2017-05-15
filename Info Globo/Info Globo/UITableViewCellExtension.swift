//
//  UITableViewCellExtension.swift
//  Info Globo
//
//  Created by Fabio Miciano on 14/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var cellIdentifier: String {
        return "\(String(describing: self))"
    }
}
