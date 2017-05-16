//
//  DetailView.swift
//  Info Globo
//
//  Created by Fabio Miciano on 16/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var autorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noticePhotoView: NoticeImageView!
    @IBOutlet weak var legendPhotoLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var heightPhotoContraint: NSLayoutConstraint!
    @IBOutlet weak var contentHeight: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    
    func configure(title: String, subTitle: String, autor: String, datePublish: String, urlPhoto: String, legendPhoto: String, text: String) {
        
        titleLabel.text = title
        subTitleLabel.text = subTitle
        autorLabel.text = autor.uppercased()
        dateLabel.text = datePublish.convertDate()
        
        if urlPhoto == "" {
            noticePhotoView.isHidden = true
            heightPhotoContraint.constant = 0
        }
        else {
            noticePhotoView.createImage(url: urlPhoto)
            legendPhotoLabel.text = legendPhoto
        }
        
        textLabel.text = text
        
    }
    
    func updateHeightContent() {
        contentHeight.constant = contentView.realHeigthView()+10
    }
}
