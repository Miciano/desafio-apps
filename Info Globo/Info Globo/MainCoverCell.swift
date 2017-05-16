//
//  MainCoverCell.swift
//  Info Globo
//
//  Created by Fabio Miciano on 14/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class MainCoverCell: NoticeCell {
    
    //PRAGMA MARK: -- OUTLETS --
    @IBOutlet weak var photoView: NoticeImageView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    //Função de configuração da célula
    override func configure(with model: CoverCellModel) {
        
        sectionLabel.text = model.section
        titleLabel.text = model.title
        photoView.createImage(url: model.photoNotice)
    }
    
}
