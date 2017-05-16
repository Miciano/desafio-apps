//
//  DetailViewController.swift
//  Info Globo
//
//  Created by Fabio Miciano on 16/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    let noticeModel: NoticeModel
    
    init(noticeModel: NoticeModel) {
        self.noticeModel = noticeModel
        super.init(nibName: nil, bundle: nil)
        //Atribuo o nome da seção ao titulo da página, se vier vazio coloco o padrão O Globo
        self.title = noticeModel.section?.name ?? "O Globo"
        
        guard let view = Bundle.main.loadNibNamed("DetailView", owner: self, options: nil)?.last as? DetailView else { return }
        //Função de configuração da View
        view.configure(title: noticeModel.title,
                       subTitle: noticeModel.subTitle,
                       autor: noticeModel.autors.count > 0 ? noticeModel.autors[0] : "",
                       datePublish: noticeModel.publishedAt,
                       urlPhoto: noticeModel.imagens.count > 0 ? noticeModel.imagens[0].url : "",
                       legendPhoto: noticeModel.imagens.count > 0 ? noticeModel.imagens[0].legend : "",
                       text: noticeModel.text)
        
        self.view = view
        
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //Atualiza o tamanho da view a cada mudança de layout
        guard let view = self.view as? DetailView else { return }
        view.updateHeightContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
