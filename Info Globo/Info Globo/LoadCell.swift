//
//  LoadCell.swift
//  Info Globo
//
//  Created by Fabio Miciano on 16/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class LoadCell: UITableViewCell {
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityView.startAnimating()
    }
}
