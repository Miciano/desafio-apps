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
    
    //PRAGMA MARK: -- OUTLETS --
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var autorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noticePhotoView: NoticeImageView!
    @IBOutlet weak var legendPhotoLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    //Constraint usada para exibir ou não a foto
    @IBOutlet weak var heightPhotoContraint: NSLayoutConstraint!
    //Constraints usadas para determinar o tamanho do scrollView
    @IBOutlet weak var contentHeight: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    
    func configure(title: String, subTitle: String, autor: String, datePublish: String, urlPhoto: String, legendPhoto: String, text: String) {
        
        titleLabel.text = title
        subTitleLabel.text = subTitle
        autorLabel.text = autor.uppercased()
        dateLabel.text = datePublish.convertDate()
        
        //Verifico se tem alguma URL de foto
        if urlPhoto == "" {
            //Se nao tiver a URL eu escondo a NoticeImageView
            noticePhotoView.isHidden = true
            heightPhotoContraint.constant = 0
        }
        else {
            noticePhotoView.createImage(url: urlPhoto)
            legendPhotoLabel.text = legendPhoto
        }
        
        textLabel.text = text
    }
    
    //Função calcula o tamanho total da view e muda o tamanho do content do Scroll
    func updateHeightContent() {
        contentHeight.constant = contentView.realHeigthView()+10
    }
}
