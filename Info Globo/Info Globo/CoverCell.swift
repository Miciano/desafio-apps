//
//  CoverCell.swift
//  Info Globo
//
//  Created by Fabio Miciano on 14/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class CoverCell: NoticeCell<CoverCellModel> {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func configure(with model: CoverCellModel) {
        
    }
    
}
