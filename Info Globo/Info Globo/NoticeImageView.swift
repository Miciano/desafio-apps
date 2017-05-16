//
//  NoticeImageView.swift
//  Info Globo
//
//  Created by Fabio Miciano on 15/05/17.
//  Copyright © 2017 Fabio Miciano. All rights reserved.
//

import Foundation
import UIKit

//Classe responsavel pelo genrenciamento de imagem
class NoticeImageView: UIView, Constraints {
    
    //PRAGMA MARK: -- LAZY VARS --
    lazy var request = {
        return MainRequests()
    }()
    
    //PRAGMA MARK: -- VARIAVEIS PRIVADAS --
    fileprivate var imageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        startActivityView()
    }
    
    //PRAGMA MARK: --  REQUEST DA IMAGEM --
    func createImage(url: String) {
        
        self.isHidden = false
        for view in self.subviews { view.removeFromSuperview() }
        
        // Se não tiver URL para para request removo todos os filhos e escondo a view
        if url == "" {
            self.isHidden = true
            return
        }
        
        //Faço o request da imagem
        request.getImage(url: url) {[weak self] (response) in
            switch response {
            case .success(let model):
                self?.createOnPhoto(with: model)
            case .downloadCanceled( _):
                self?.createImage(url: url)
            case .invalidResponse:
                fatalError("Response de imagem inválido")
            }
        }
    }
    
    //PRAGMA MARK: -- CRIACAO DA IMAGEM --
    fileprivate func createOnPhoto(with image:UIImage)
    {
        //Removo o activityView
        removeActivityView()
        
        //Adiciono a image atras de todos os elementos com contraints que façam com que ela fique do tamanho da view
        let imageView = UIImageView(image: image)
        self.insertSubview(imageView, at: 0)
        addConstraints(imageView, toItem: self, attributes: [.top, .leading, .trailing, .bottom], constants: [0,0,0,0])
    }
    
    //PRAGMA MARK: -- CONTROLLE DO ACTIVITY VIEW --
    fileprivate func startActivityView() {
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .white)
        addSubview(activity)
        activity.startAnimating()
        
        addConstraints(activity, toItem: self, attributes: [.centerX, .centerY], constants: [0,0])
    }
    
    fileprivate func removeActivityView() {
        
        for view in self.subviews {
            if view is UIActivityIndicatorView { view.removeFromSuperview() }
        }
    }
}
